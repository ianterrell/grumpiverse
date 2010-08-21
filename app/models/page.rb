class Page < ActiveRecord::Base
  
  def name
    slug
  end
end
