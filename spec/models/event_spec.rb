require 'spec_helper'

describe Event do
  context '#attending?' do
    context 'user has attendance to the event' do
      it 'attends to the event' do
        user = create :user
        date_time_now = DateTime.now
        one_hour_later = date_time_now + 1.hour
        three_hours_later = date_time_now + 3.hour

        event = Event.create(name: 'Ruby-tapas', location: 'braga', start_date: date_time_now, end_date: one_hour_later, owner_id: user.id)
        Availability.create(week_day: date_time_now.wday, start_time: date_time_now, end_time: three_hours_later, user_id: user.id)
        Attendance.create(user_id: user.id, event_id: event.id)

        user_attendding_to_event = event.attending?(user.id)

        expect(user_attendding_to_event).to eq(true)
      end
    end

    context 'user has  not attendance to the event' do
      it "doesn't attend to the event" do
        user = create :user
        date_time_now = DateTime.now
        one_hour_later = date_time_now + 1.hour
        three_hours_later = date_time_now + 3.hour
        event = Event.create(name: 'Ruby-tapas', location: 'braga', start_date: date_time_now, end_date: one_hour_later, owner_id: user.id)
        Availability.create(week_day: date_time_now.wday, start_time: date_time_now, end_time: three_hours_later, user_id: user.id)

        user_attendding_to_event = event.attending?(user.id)

        expect(user_attendding_to_event).to eq(false)
      end
    end
  end

  context '#notify_users' do
    context 'after create an event' do
      it 'is called the perform_async on EventNotifications' do
        user = create :user
        date_time_now = DateTime.now
        one_hour_later = date_time_now + 1.hour
        three_hours_later = date_time_now + 3.hour
        Availability.create(week_day: date_time_now.wday, start_time: date_time_now, end_time: three_hours_later, user_id: user.id)

        allow(EventNotifications).to receive(:perform_async)
        Event.create(name: 'Ruby-tapas', location: 'braga', start_date: date_time_now, end_date: one_hour_later, owner_id: user.id)

        expect(EventNotifications).to have_received(:perform_async)
      end

      context 'there are no users with availability' do
        it 'is called the perform_async on EventNotifications' do
          user = create :user
          date_time_now = DateTime.now
          one_hour_later = date_time_now + 1.hour

          allow(EventNotifications).to receive(:perform_async)
          Event.create(name: 'Ruby-tapas', location: 'braga', start_date: date_time_now, end_date: one_hour_later, owner_id: user.id)

          expect(EventNotifications).to have_received(:perform_async)
        end
      end
    end
  end

  context '#attend' do
    context 'creating attendance between a given user and the event' do
      it 'creates the attendance' do
        user = create :user
        user2 = create :user
        date_time_now = DateTime.now
        one_hour_later = date_time_now + 1.hour
        event = Event.create(name: 'Ruby-tapas', location: 'braga', start_date: date_time_now, end_date: one_hour_later, owner_id: user.id)

        attending = event.attend(user2.id)

        expect(attending.user_id).to eq(user2.id)
        expect(attending.event_id).to eq(event.id)
      end
    end

    context 'creating more than one attendance between the same event and user' do
      it 'does not create nore than one' do
        user = create :user
        user2 = create :user
        date_time_now = DateTime.now
        one_hour_later = date_time_now + 1.hour
        event = Event.create(name: 'Ruby-tapas', location: 'braga', start_date: date_time_now, end_date: one_hour_later, owner_id: user.id)

        event.attend(user2.id)
        event.attend(user2.id)
        event.attend(user2.id)

        attendances = Attendance.all.count { |attendance| attendance.user_id == user2.id && attendance.event_id == event.id }

        expect(attendances).to eq(1)
      end
    end
  end

  context '#cancel' do
    context 'cancel attendance between a given user and the event' do
      it 'destroys attendance' do
        user = create :user
        user2 = create :user
        date_time_now = DateTime.now
        one_hour_later = date_time_now + 1.hour
        event = Event.create(name: 'Ruby-tapas', location: 'braga', start_date: date_time_now, end_date: one_hour_later, owner_id: user.id)
        event.attend(user2.id)

        event.cancel(user2.id)
        attendance = Attendance.find_by(user_id: user2.id, event_id: event.id)

        expect(attendance).to be(nil)
      end
    end
  end
end
