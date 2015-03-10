require 'spec_helper'

describe Availability do
  context '#include?' do
    context 'An event is in the range' do
      it 'is available' do
        user = create :user
        date_time_now = DateTime.now
        one_hour_later = date_time_now + 1.hour
        three_hours_later = date_time_now + 3.hour
        availability = Availability.create(week_day: date_time_now.wday, start_time: date_time_now, end_time: three_hours_later, user_id: user.id)

        result = availability.include?(one_hour_later)

        expect(result).to be(true)
      end
    end
    context 'An event is in the range' do
      it 'is not available' do
        user = create :user
        date_time_now = DateTime.now
        one_hour_earlier = date_time_now - 1.hour
        three_hours_later = date_time_now + 3.hour
        availability = Availability.create(week_day: date_time_now.wday, start_time: date_time_now, end_time: three_hours_later, user_id: user.id)

        result = availability.include?(one_hour_earlier)

        expect(result).to be(false)
      end
    end
    context 'An event starts in the range and ends out of the range' do
      it 'is available' do
        user = create :user
        date_time_now = DateTime.now
        one_hour_later = date_time_now + 1.hour
        three_hours_later = date_time_now + 3.hour
        four_hours_later = date_time_now + 4.hour
        availability = Availability.create(week_day: date_time_now.wday, start_time: date_time_now, end_time: three_hours_later, user_id: user.id)
        event = Event.new(name: 'random event', location: 'Braga', start_date: one_hour_later, end_date: four_hours_later, owner_id: user.id)

        result = availability.include?(event.start_date)

        expect(result).to be(true)
      end
    end
    context 'An event starts before the range and ends in the range' do
      it 'is not available' do
        user = create :user
        date_time_now = DateTime.now
        one_hour_earlier = date_time_now - 1.hour
        two_hours_later = date_time_now + 2.hour
        three_hours_later = date_time_now + 3.hour
        availability = Availability.create(week_day: date_time_now.wday, start_time: date_time_now, end_time: three_hours_later, user_id: user.id)
        event = Event.new(name: 'random event', location: 'Braga', start_date: one_hour_earlier, end_date: two_hours_later, owner_id: user.id)
        result = availability.include?(event.start_date)

        expect(result).to be(false)
      end
    end
  end

  context '#events_of_the_day' do
    it 'returns events of the day' do
    end
  end
end
