class TwitterIntegration

  def self.update_status(message)
    TwitterApi.client.update(message)
  end
end
