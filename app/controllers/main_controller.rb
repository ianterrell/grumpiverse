class MainController < ApplicationController
  def index
    @featured_article = Article.published.first
    @recent_grumps = Article.published.offset(1).limit(4)
  end
end
