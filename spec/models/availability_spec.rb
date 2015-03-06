require 'spec_helper'

describe Availability do
  context '#include?' do
    context 'An event is in the range' do
      it 'is available' do
        user = create :user
        availability = Availability.create(week_day: DateTime.new(2015, 03, 06, 20, 00).wday, start_time: DateTime.new(2015, 03, 06, 20, 00), end_time: DateTime.new(2015, 03, 06, 23, 30), user_id: user.id)
        date = DateTime.new(2015, 03, 06, 21, 00)

        result = availability.include?(date)

        expect(result).to be(true)
      end
    end
    context 'An event is in the range' do
      it 'is not available' do
        user = create :user
        availability = Availability.create(week_day: DateTime.new(2015, 03, 06, 20, 00).wday, start_time: DateTime.new(2015, 03, 06, 20, 00), end_time: DateTime.new(2015, 03, 06, 23, 30), user_id: user.id)
        date = DateTime.new(2015, 03, 06, 18, 00)

        result = availability.include?(date)

        expect(result).to be(false)
      end
    end
    context 'An event starts in the range and ends out of the range' do
      it 'is available' do
        user = create :user
        availability = Availability.create(week_day: DateTime.new(2015, 03, 06, 20, 00).wday, start_time: DateTime.new(2015, 03, 06, 20, 00), end_time: DateTime.new(2015, 03, 06, 23, 30), user_id: user.id)
        event = Event.new(name: 'random event', location: 'Braga', start_date: DateTime.new(2015, 03, 06, 23, 00), end_date: DateTime.new(2015, 03, 06, 23, 31), owner: user.id)

        result = availability.include?(event.start_date)

        expect(result).to be(true)
      end
    end
    context 'An event starts before the range and ends in the range' do
      it 'is not available' do
        user = create :user
        availability = Availability.create(week_day: DateTime.new(2015, 03, 06, 20, 00).wday, start_time: DateTime.new(2015, 03, 06, 20, 00), end_time: DateTime.new(2015, 03, 06, 23, 30), user_id: user.id)
        event = Event.new(name: 'random event', location: 'Braga', start_date: DateTime.new(2015, 03, 06, 19, 00), end_date: DateTime.new(2015, 03, 06, 21, 00), owner: user.id)

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
