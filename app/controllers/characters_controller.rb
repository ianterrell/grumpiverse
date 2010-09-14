class CharactersController < ApplicationController
  layout 'content'

  caches_page :index, :show
  
  def index
    @characters = Character.all
  end
  
  def show
    @character = Character.find params[:id]
    @recent_articles = @character.articles.published.limit(5)
    @title = @character.seo.try :title
    @meta_keywords = @character.seo.try :keywords
    @meta_description = @character.seo.try :description
  end
end
