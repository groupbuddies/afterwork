class TwitterIntegration
  def self.update_status(user_name, event_name, hashtag)
    TwitterApi.client.update("@#{user_name} don't forget to attend #{event_name}! #{hashtag}".truncate(140))
  end
end
