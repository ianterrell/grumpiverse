class ArticlesController < ApplicationController
  layout 'content'
  caches_page :show
  def show
    @article = Article.published.find params[:id]
    @title = @article.seo.try :title
    @meta_keywords = @article.seo.try :keywords
    @meta_description = @article.seo.try :description
  end
end
