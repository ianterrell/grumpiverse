class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :shield
  
protected
  def shield
    redirect_to shield_path and return unless session[:cleared_for_takeoff]
  end
end
