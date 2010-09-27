class Admin::ComicsController < Admin::CrudController
  def index
    @comics = Comic.order("updated_at DESC").paginate :page => params[:page]
  end
end
