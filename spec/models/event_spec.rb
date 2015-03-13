require 'spec_helper'

describe Event do
  context '#users_available' do
    context 'A event has users available' do
      it 'returns a list with a user' do
        stub_request(:any, 'https://api.twitter.com/1.1/statuses/update.json')
        user = create(:user, interest_list: 'Ruby')
        Availability.create(week_day: 5, start_time: DateTime.new(2015, 03, 06, 20, 00), end_time: DateTime.new(2015, 03, 06, 23, 30), user_id: user.id)
        event = Event.create(name: 'Random Event', location: 'Braga', start_date: DateTime.new(2015, 03, 06, 20, 30), end_date: DateTime.new(2015, 03, 06, 21, 00), owner: user.id, interest_list: 'Ruby')

        allow(event).to reveice(:notify_users)
        event.notify_users

        expect(event).to have_received(:notify_users)
      end
    end
  end
end
