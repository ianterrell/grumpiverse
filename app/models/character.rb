class Character < ActiveRecord::Base
  has_friendly_id :slug
  
  def render_description
    RedCloth.new(description).to_html.html_safe
  end
end
