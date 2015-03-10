require 'spec_helper'

describe Attendance do
  context '#attending' do
    context 'The user is attending the event' do
      it 'is attending' do
        user = create :user
        date_time_now = DateTime.now
        one_hour_later = date_time_now + 1.hour
        event = Event.create(name: 'Ruby-tapas', location: 'braga', start_date: date_time_now, end_date: one_hour_later, owner_id: user.id)
        event.attend(user.id)

        attending = Attendance.attending?(user.id, event.id)

        expect(attending).to be(true)
      end
    end

    context 'user is not attending the event' do
      it 'is not attending' do
        user = create :user
        date_time_now = DateTime.now
        one_hour_later = date_time_now + 1.hour
        event = Event.create(name: 'Ruby-tapas', location: 'braga', start_date: date_time_now, end_date: one_hour_later, owner_id: user.id)

        attending = Attendance.attending?(user.id, event.id)

        expect(attending).to be(false)
      end
    end
  end
end
