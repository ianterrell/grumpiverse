class Admin::ComicsController < Admin::CrudController
  def index
    @comics = Comic.paginate :page => params[:page]
  end
end
