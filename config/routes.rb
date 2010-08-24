Grumpiverse::Application.routes.draw do
  devise_for :users
  
  match 'cast', :to => "characters#index"
  match 'cast/:id', :to => "characters#show", :as => "character"
  
  resources :articles, :only => :show
  resources :users, :only => :show

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
    root :to => "base#root"
  end
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "main#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  match '*slug', :to => 'pages#show', :as => "page"
end
