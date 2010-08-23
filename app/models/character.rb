class Character < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  
  validates_presence_of :name, :twitter_handle
  
  def render_description
    RedCloth.new(description).to_html.html_safe
  end
end
