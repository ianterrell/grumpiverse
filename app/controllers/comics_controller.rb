class ComicsController < ApplicationController
  layout nil
  
  def show
    # @comic = params[:id] ? Comic.published.first : Comic.published.find(params[:id])
    # @title = @comic.title
  end
end
