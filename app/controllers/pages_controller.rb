class PagesController < ApplicationController
  layout 'content'
  caches_page :show
  def show
    @page = Page.find_by_slug! params[:slug]
    @title = @page.title
    @meta_keywords = @page.keywords
    @meta_description = @page.description
  end
end
