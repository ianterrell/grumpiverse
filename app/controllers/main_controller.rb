class MainController < ApplicationController
  def index
    @articles = Article.published.limit(5)
  end
  
  def feed
    @articles = Article.published.limit(10)
  end
end
