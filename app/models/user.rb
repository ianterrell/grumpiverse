class User < ActiveRecord::Base
  validates_presence_of :name

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :avatar
  
  has_attached_file :avatar, PaperclipStorageHash.merge(:styles => { :big => "120x120>", :medium => "100x100>", :thumb => "80x80>", :small => "60x60>", :tiny => "30x30>" })
end
