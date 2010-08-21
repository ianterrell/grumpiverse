class Page < ActiveRecord::Base
  
  def render
    RedCloth.new(body).to_html.html_safe
  end
  
  def name
    slug
  end
end
