Grumpiverse::Application.routes.draw do
  devise_for :users
  
  match 'cast', :to => "characters#index"
  match 'cast/:id', :to => "characters#show", :as => "character"
  
  match 'archive/:year/:month', :to => "articles#archive", :year => Time.now.year, :month => Time.now.month, :as => "archive"
  resources :articles, :only => :show

  namespace :admin do
    resources :characters do
      collection do
        post :reorder
      end
    end
    resources :articles do
      collection do
        get :published
        get :all
      end
      member do
        post :schedule_for_publication
        post :undo_schedule_for_publication
      end
    end
    resources :comics
    resources :tweets do
      collection do
        get :tweeted
      end
    end
    resources :pages
    resources :grams do
      collection do
        post :reorder
      end
    end
    match "textile", :to => "base#parse_textile"
    match "nuke", :to => "base#nuke_cache"
    root :to => "base#root"
  end

  match "feed.:format", :to => "main#feed", :as => "feed"
  match "sitemap.:format", :to => "main#sitemap"
  root :to => "main#index"

  match '*slug', :to => 'pages#show', :as => "page"
end
