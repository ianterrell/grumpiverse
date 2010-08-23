class Admin::ArticlesController < Admin::CrudController
  def index
    @drafts = Article.drafts
    @scheduled_articles = Article.scheduled
  end
  
  def all
    @articles = Article.order("updated_at desc").paginate :page => params[:page]
  end
  
  def published
    @articles = Article.published.paginate :page => params[:page]
    render :action => :all
  end
  
  def schedule_for_publication
    @article = Article.find params[:id]
    if @article.schedule_for_publication_at params[:publish_at]
      flash[:notice] = "Scheduled!"
    else
      flash[:alert] = "There was an error.  Dammit.  Make sure this object validates."
    end
    redirect_to [:admin, @article]
  end
  
  def undo_schedule_for_publication
    @article = Article.find params[:id]
    if @article.undo_schedule_for_publication
      flash[:notice] = "No longer scheduled for publication!"
    else
      flash[:alert] = "There was an error.  Dammit.  Make sure this object validates."
    end
    redirect_to [:admin, @article]
  end
end
