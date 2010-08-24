class TweetPublicationJob < Struct.new(:tweet_id)
  def perform
    Tweet.find(tweet_id).publish!
  end
end