class Admin::TweetsController < Admin::CrudController
  def index
    @tweets = Tweet.scheduled
  end
  
  def tweeted
    @tweets = Tweet.tweeted.paginate :page => params[:page]
    render :action => :index
  end
  
  def create
    create! do |success, failure|
      success.html { redirect_to admin_tweets_path }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to admin_tweets_path }
    end
  end
end
