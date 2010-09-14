class MainController < ApplicationController
  skip_before_filter :shield, :only => :feed
  
  caches_page :index, :feed, :sitemap
  
  def index
    @articles = Article.published.limit(5)
  end
  
  def feed
    @articles = Article.published.limit(10)
  end
  
  def sitemap
    @articles = Article.published
    @characters = Character.order("updated_at DESC").all
    @pages = Page.all
  end
end
