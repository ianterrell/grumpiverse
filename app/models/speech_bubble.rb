class SpeechBubble < ActiveRecord::Base
  belongs_to :comic
  
  validates_presence_of :words
  validates_length_of :words, :maximum => 1024
end
