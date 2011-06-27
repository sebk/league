GobasLadder::Application.routes.draw do

  devise_for :users

  get 'me' => 'home#me', :as => "show_me"

  get 'my/home' => 'my#overview', :as => "my_overview"
  get 'my/participations' => 'my#participations', :as => "my_participations"
  get 'my/teams' => 'my#teams', :as => "my_teammemberships"
  get 'my/games_to_be_confirmed' => 'my#games_to_be_confirmed', :as => "my_games_to_be_confirmed"

  



  get "me/edit" => "home#editme", :as => "edit_me"
  put "me" => "home#updateme", :as => "update_me"
  post "me/join_team" => "home#join_team"

  resources :users do
    resources :teammemberships
  end
    
  
  resources :teams do
    member do
      post 'create_participation'
    end
  end

  resources :ladders do
    resources :games
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
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
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
  #       get 'recent', :on => :collection
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
  root :to => "home#me"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
