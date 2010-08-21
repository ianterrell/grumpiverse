class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  
  def root
    redirect_to admin_pages_path
  end
end
