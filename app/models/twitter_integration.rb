class TwitterIntegration
  def self.update_status(user_name, event_name, hashtag)
    TwitterApi.client.update("@#{user_name} don't forget #{event_name} IN afterwork! #{hashtag}")
  end
end
