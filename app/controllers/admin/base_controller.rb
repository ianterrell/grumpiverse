class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  
  def root
    flash.keep
    redirect_to admin_articles_path
  end
end
