class Character < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  has_and_belongs_to_many :comics
  validates_presence_of :name, :svg  
end
