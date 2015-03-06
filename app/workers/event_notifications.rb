class EventNotifications
  include Sidekiq::Worker

  def perform(event_id)
    event = Event.find(event_id)

    available_users = User.users_available(event.start_date)

    available_users.each do |user|
      TwitterIntegration.update_status(user.screen_name, event.name, event.hashtag)
    end
  end
end
