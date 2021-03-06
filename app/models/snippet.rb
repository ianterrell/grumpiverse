class Snippet < ActiveRecord::Base
  validates_presence_of :name, :body
  
  default_scope order(:position)
  
  def render
    RedCloth.new(body.to_s).to_html.html_safe
  end
end
