class PagesController < ApplicationController
  layout 'content'
  caches_page :show
  def show
    @page = Page.find_by_slug! params[:slug]
    @title = @article.seo.try :title
    @meta_keywords = @article.seo.try :keywords
    @meta_description = @article.seo.try :description
  end
end
