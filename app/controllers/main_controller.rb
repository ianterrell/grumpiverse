class MainController < ApplicationController
  def index
    @featured_article = Article.published.first
    @recent_grumps = Article.published.offset(1).limit(4)
  end
  
  def feed
    @articles = Article.published.limit(10)
  end
end
