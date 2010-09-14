class Tweet < ActiveRecord::Base
  belongs_to :delayed_job, :class_name => "::Delayed::Job", :foreign_key => "delayed_job_id"
  belongs_to :character
  
  validates_presence_of :tweet, :scheduled_for_publication_at
  validates_length_of :tweet, :within => 3..140
  
  def name
    id
  end

  scope :scheduled, where("scheduled_for_publication_at IS NOT NULL AND tweeted_at IS NULL").order(:scheduled_for_publication_at)
  def scheduled?
    !tweeted? && !!scheduled_for_publication_at
  end
  
  scope :tweeted, where("tweeted_at IS NOT NULL").order("tweeted_at DESC")
  def tweeted?
    !!tweeted_at
  end

  def scheduled_publication_day
    scheduled_for_publication_at.to_date
  end
  
  after_create :schedule_for_publication
  after_save :update_publication
  before_destroy :cancel_publication
  
  def schedule_for_publication
    job = Delayed::Job.enqueue TweetPublicationJob.new(id), 0, scheduled_for_publication_at
    self.update_attribute :delayed_job_id, job.id
  end
  
  def update_publication
    self.delayed_job.try :update_attribute, :run_at, scheduled_for_publication_at
  end
  
  def cancel_publication
    self.delayed_job.try :destroy
  end
  
  def tweeted?
    !!tweeted_at
  end
  
  def publish!
    oauth = Twitter::OAuth.new(TWITTER[:consumer_key], TWITTER[:consumer_secret])
    if character 
      raise "#{self.character.name} needs authorized with Twitter!" unless character.twitter_ready?
      oauth.authorize_from_access(character.twitter_token, character.twitter_secret)
    else
      oauth.authorize_from_access(TWITTER[:main_account_token], TWITTER[:main_account_secret])
    end

    client = Twitter::Base.new(oauth)
    client.update tweet
    self.update_attribute :tweeted_at, Time.now
  end
end
