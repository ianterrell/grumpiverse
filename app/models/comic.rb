class Comic < ActiveRecord::Base
  belongs_to :delayed_job, :class_name => "::Delayed::Job", :foreign_key => "delayed_job_id"
  belongs_to :left_character, :class_name => "Character", :foreign_key => "left_character_id"
  belongs_to :right_character, :class_name => "Character", :foreign_key => "right_character_id"
  
  has_many :speech_bubbles
  accepts_nested_attributes_for :speech_bubbles
  validates_associated :speech_bubbles
  
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true, :strip_non_ascii => true
  
  validates_presence_of :title

  scope :drafts, where("scheduled_for_publication_at IS NULL").order("updated_at DESC")
  def draft?
    !scheduled? && !published?
  end
  
  scope :scheduled, where("scheduled_for_publication_at IS NOT NULL AND published_at IS NULL").order(:scheduled_for_publication_at)
  def scheduled?
    !published? && !!scheduled_for_publication_at
  end
  
  scope :published, where("published_at IS NOT NULL").order("published_at DESC")
  scope :published_in_month, lambda { |d| where(:published_at  => d.beginning_of_month..d.end_of_month) }  
  def published?
    !!published_at
  end
  
  def previous
    Comic.where("published_at IS NOT NULL").where("published_at < ?", self.published_at).order("published_at DESC").limit(1).first
  end
  
  def next
    Comic.where("published_at IS NOT NULL").where("published_at > ?", self.published_at).order("published_at ASC").limit(1).first
  end
  
  def name
    id
  end
  
  def scheduled_publication_day
    scheduled_for_publication_at.to_date
  end
  
  def published_day
    published_at.to_date
  end
  
  def schedule_for_publication_at(publish_at)
    self.scheduled_for_publication_at = Time.zone.parse(publish_at)
    if scheduled?
      job = Delayed::Job.enqueue ComicPublicationJob.new(id), 0, scheduled_for_publication_at
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
end
