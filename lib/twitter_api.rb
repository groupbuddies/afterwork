class TwitterApi
  def self.client
    @client ||= Twitter::Client.new(
      consumer_key: ENV['TWITTER_KEY'],
      consumer_secret: ENV['TWITTER_SECRET'],
      oauth_token: ENV['TWITTER_ACCESS_TOKEN'],
      oauth_token_secret: ENV['TWITTER_ACCESS_TOKEN_SECRET']
    )
  end
end
