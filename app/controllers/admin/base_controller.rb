class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  
  def root
    flash.keep
    redirect_to admin_articles_path
  end
  
  def parse_textile
    render :text => RedCloth.new(params[:data]).to_html.html_safe
  end
  
  def nuke_cache
    if !request.post?
      flash[:alert] = "Must be a POST!"
    else
      Cache.nuke!
      flash[:notice] = "Cache expired."
    end
    redirect_to admin_articles_path
  end
end
