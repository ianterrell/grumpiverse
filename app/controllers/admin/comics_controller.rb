class Admin::ComicsController < Admin::BaseController
  inherit_resources
  
  def index
    @drafts = Comic.drafts
    @scheduled_comics = Comic.scheduled
  end
  
  def all
    @comics = Comic.order("updated_at desc").paginate :page => params[:page]
  end
  
  def published
    @comics = Comic.published.paginate :page => params[:page]
    render :action => :all
  end
  
  def schedule_for_publication
    @comic = Comic.find params[:id]
    if @comic.schedule_for_publication_at(params[:publish_date] + " " + params[:publish_time])
      flash[:notice] = "Scheduled!"
    else
      flash[:alert] = "There was an error.  Dammit.  Make sure this object validates."
    end
    redirect_to [:admin, @comic]
  end
  
  def undo_schedule_for_publication
    @comic = Comic.find params[:id]
    if @comic.undo_schedule_for_publication
      flash[:notice] = "No longer scheduled for publication!"
    else
      flash[:alert] = "There was an error.  Dammit.  Make sure this object validates."
    end
    redirect_to [:admin, @comic]
  end
  
  def preview
    render :text => ComicRenderer.new.render
  end
end
