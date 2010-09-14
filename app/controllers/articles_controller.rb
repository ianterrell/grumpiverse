class ArticlesController < ApplicationController
  layout 'content'
  
  caches_page :show, :archive
  
  def show
    @article = Article.published.find params[:id]
    @title = @article.seo.try(:title).blank? ? @article.title : @article.seo.title
    @meta_keywords = @article.seo.try :keywords
    @meta_description = @article.seo.try :description
  end
  
  def archive
    @month = Time.parse "#{params[:year]}/#{params[:month]}"
    if @month > Time.now.end_of_month
      redirect_to archive_path
    elsif @month < Article::FirstMonth
      redirect_to archive_path :year => Article::FirstMonth.year, :month => Article::FirstMonth.month
    else
      @articles = Article.published_in_month(@month)
    end
  end
end
