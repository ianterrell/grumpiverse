Grumpiverse::Application.routes.draw do
  resources :comics, :only => :show
  match "feed.:format", :to => "comics#feed", :as => "feed"
  root :to => "comics#show"

  devise_for :users  
  namespace :admin do
    resources :characters
    resources :comics do
      collection do
        get :published
        get :all
      end
      member do
        get :preview
        post :schedule_for_publication
        post :undo_schedule_for_publication
      end
    end
    root :to => "base#root"
  end
end
