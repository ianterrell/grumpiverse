class ArticlesController < ApplicationController
  layout 'content'
  caches_page :show
  def show
    @article = Article.find params[:id]
    @title = @article.seo.try :title
    @meta_keywords = @article.seo.try :keywords
    @meta_description = (desc = @article.seo.try(:description)).blank? ? @article.short_excerpt : desc
  end
end
