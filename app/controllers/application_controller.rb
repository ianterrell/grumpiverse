class ApplicationController < ActionController::Base
  layout :resolve_layout
  protect_from_forgery

protected
  def resolve_layout
    devise_controller? ? 'devise' : 'application'
  end
end
