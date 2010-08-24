class Page < ActiveRecord::Base
  belongs_to :seo
  accepts_nested_attributes_for :seo
  
  def render
    RedCloth.new(body).to_html.html_safe
  end
  
  def name
    slug
  end
end
