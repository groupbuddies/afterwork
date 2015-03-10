class EventNotifications
  include Sidekiq::Worker

  def perform(event_id)
    event = Event.find(event_id)

    availabilities = Availability.available_at(event.start_date)

    availabilities.each do |availability|
      user = User.find(availability.user_id)
      TwitterIntegration.update_status(user.screen_name, event.name, event.hashtag)
    end
  end
end
