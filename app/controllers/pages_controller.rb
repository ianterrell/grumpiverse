class PagesController < ApplicationController
  layout 'content'
  
  caches_page :show
  
  def show
    @page = Page.find_by_slug! params[:slug]
    @title = @page.seo.try :title
    @meta_keywords = @page.seo.try :keywords
    @meta_description = @page.seo.try :description
  end
end
