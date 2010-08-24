class CharactersController < ApplicationController
  layout 'content'
  
  def index
    @characters = Character.all
  end
  
  def show
    @character = Character.find params[:id]
    @recent_articles = @character.articles.published.limit(5)
  end
end
