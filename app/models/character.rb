class Character < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  
  has_and_belongs_to_many :articles
  
  belongs_to :seo
  accepts_nested_attributes_for :seo
  
  validates_presence_of :name, :twitter_handle
  
  has_attached_file :avatar, PaperclipStorageHash.merge(:styles => { :big => "120x120>", :medium => "100x100>", :thumb => "80x80>", :small => "60x60>", :tiny => "30x30>" })
  has_attached_file :picture, PaperclipStorageHash.merge(:styles => { :thumb => "80>x80" })
  
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
  
  def twitter_ready?
    !self.twitter_token.blank? && !self.twitter_secret.blank?
  end
  
  # Steps to authorize a character!
  # > c = Character.find 1
  #  => #<Character id: 1, name: "Grumpalupagus", twitter_handle: "grumpalupagus", ...
  # > c.display_twitter_auth_url
  # Log in as grumpalupagus and then paste this into your browser
  # http://api.twitter.com/oauth/authorize?oauth_token=rerhlWkALYEOzoKrGzUKX4ICtMhl04CusckJicwIU
  #  => nil 
  # > c.authorize_twitter_with_pin "2085215"
  #  => true 
  # > c.twitter_ready?
  #  => true 
  
  def display_twitter_auth_url
    @oauth ||= Twitter::OAuth.new(TWITTER[:consumer_key], TWITTER[:consumer_secret])
    puts "Log in as #{twitter_handle.blank? ? 'the character' : twitter_handle} and then paste this into your browser"
    puts @oauth.request_token.authorize_url
    nil
  end
  
  def authorize_twitter_with_pin(pin)
    self.twitter_token, self.twitter_secret = @oauth.authorize_from_request(@oauth.request_token.token, @oauth.request_token.secret, pin)
    self.save!
  end
end
