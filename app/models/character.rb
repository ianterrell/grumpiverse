class Character < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  
  has_many :articles, :as => :author
  
  belongs_to :seo
  accepts_nested_attributes_for :seo
  
  validates_presence_of :name, :twitter_handle
  
  has_attached_file :avatar, PaperclipStorageHash.merge(:styles => { :big => "120x120>", :medium => "100x100>", :thumb => "80x80>", :small => "60x60>", :tiny => "30x30>" })
  has_attached_file :picture, PaperclipStorageHash.merge(:styles => { :thumb => "80x80>" })
  
  def render_description
    RedCloth.new(description).to_html.html_safe
  end
  
  def render_short_description
    RedCloth.new(short_description).to_html.html_safe
  end
  
  before_save :remove_attachments
  attr_accessor :remove_picture, :remove_avatar
  def remove_attachments
    self.avatar = nil if @remove_avatar == "1"
    self.picture = nil if @remove_picture == "1"
  end
end
