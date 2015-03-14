require 'spec_helper'

describe Event do
  context '#users_available' do
    context 'A event has users available' do
      it 'calls the action notify_users' do
        stub_request(:any, 'https://api.twitter.com/1.1/statuses/update.json')
        user = create(:user, interest_list: 'Ruby')
        Availability.create(week_day: 5, start_time: DateTime.new(2015, 03, 06, 20, 00), user_id: user.id)
        event = Event.create(name: 'Random Event', location: 'Braga', start_date: DateTime.new(2015, 03, 06, 20, 30), owner: user.id, interest_list: 'Ruby')

        allow(event).to receive(:notify_users)
        event.notify_users

        expect(event).to have_received(:notify_users)
      end
    end
  end
end
