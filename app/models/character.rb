class Character < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  has_many :comics_on_left, :class_name => "Comic", :foreign_key => "left_character_id"
  has_many :comics_on_right, :class_name => "Comic", :foreign_key => "right_character_id"
  validates_presence_of :name, :svg  
end
