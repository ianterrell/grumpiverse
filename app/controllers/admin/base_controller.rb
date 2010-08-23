class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  
  def root
    redirect_to admin_pages_path
  end
  
  def parse_textile
    render :text => RedCloth.new(params[:data]).to_html.html_safe
  end
end
