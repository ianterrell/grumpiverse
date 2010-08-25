class ShieldController < ApplicationController
  layout nil
  skip_before_filter :shield
  def index
    if request.post?
      if params[:code] == "rumpleforeskin"
        session[:cleared_for_takeoff] = true
        redirect_to root_path
      end
    end
  end
end
