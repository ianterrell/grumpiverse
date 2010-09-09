class Comic < ActiveRecord::Base
  has_attached_file :image, PaperclipStorageHash.merge(:styles => { :main => "650>x650", :thumb => "80>x80" })
  
  validates_attachment_presence :image
  validates_presence_of :alt_text
  
  scope :recent, order("updated_at DESC").limit(10)
  
  def name
    id
  end
  
  before_save :remove_attachments
  attr_accessor :remove_image
  def remove_attachments
    self.image = nil if @remove_image == "1"
  end
end
