class Article < ActiveRecord::Base
  belongs_to :delayed_job, :class_name => "::Delayed::Job", :foreign_key => "delayed_job_id"
  belongs_to :author, :polymorphic => true
  belongs_to :main_comic, :class_name => "Comic", :foreign_key => "main_comic_id"
  
  has_friendly_id :title, :use_slug => true
  
  validates_presence_of :title, :body
  
  scope :drafts, where("scheduled_for_publication_at IS NULL").order("updated_at DESC")
  def draft?
    !scheduled? && !published?
  end
  
  scope :scheduled, where("scheduled_for_publication_at IS NOT NULL AND published_at IS NULL").order(:scheduled_for_publication_at)
  def scheduled?
    !published? && !!scheduled_for_publication_at
  end
  
  scope :published, where("published_at IS NOT NULL").order("published_at DESC")
  def published?
    !!published_at
  end
  
  def name
    id
  end
  
  def scheduled_publication_day
    scheduled_for_publication_at.to_s :pretty
  end
  
  def schedule_for_publication_at(publish_at)
    Time.zone = "Pacific Time (US & Canada)"
    self.scheduled_for_publication_at = Time.zone.parse(publish_at)
    if scheduled?
      job = Delayed::Job.enqueue ArticlePublicationJob.new(id), 0, scheduled_for_publication_at
      self.delayed_job_id = job.id
      self.save(false)
    else
      false
    end
  end
  
  def undo_schedule_for_publication
    if scheduled?
      self.delayed_job.try :destroy
      self.update_attribute :scheduled_for_publication_at, nil
    else
      false
    end
  end
  
  def publish!
    self.update_attribute :published_at, Time.now
  end
  
  def author_code
    author.blank? ? nil : "#{author.class.name}:#{author.id}"
  end
  
  def author_code=(code)
    class_name, instance_id = code.split ':'
    self.author = class_name.constantize.find instance_id
  end
  
  def render(what = nil)
    copy = case what
    when :short: short_excerpt
    when :long: long_excerpt
    else 
      body
    end
    RedCloth.new(copy.to_s).to_html.html_safe
  end
end
