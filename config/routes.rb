TheBrands::Application.routes.draw do
  resources :pages
  resources :funny_videos
  resources :users do
     get ':id/page/:page', "user#show", :action => :show, :on => :collection
  end
  
  resources :uploads do
    get 'page/:page', :action => :index, :on => :collection
  member do
    get "like"
    post "hate"
    post "likeit"
    end
  end 
  match "/top_pics", to: "uploads#top"
  resources :categories 
   match '/auth/:provider/callback' => 'user_oauth#create', :as => :callback
  match '/auth/failure' => 'user_oauth#failure', :as => :failure
  
  match '/auth/facebook' => 'user_oauth#create', :as => :fb_login
  match '/auth/twitter' => 'user_oauth#create', :as => :tw_login

  
  resources :links
  resources :user_sessions, only: [:new, :create, :destroy]
  match '/feed' => 'uploads#feed', :as => :feed, :defaults => { :format => 'atom' }
  match "/link-up", to: "Pages#link_up"
  match "/r_u_lost", to: "Pages#lost_page"
  match '/terms', to: 'Pages#terms'
  match 'login', to: 'user_sessions#new'
  match 'loginout', to: 'user_sessions#destroy'

  match "/signup", to: "users#new"
   match '/knowd', to: "Pages#knowd"
  match '/about', to: "Pages#about"
  match '/help', to: "Pages#help"
  match '/contact', to: "Pages#contact"
  match '/privacy', to: "Pages#privacy"

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
   root :to => 'Pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
#== Route Map
# Generated on 08 Jul 2012 00:04
#
#    signup     /signup(.:format)    users#new
#     about     /about(.:format)     Pages#about
#      help     /help(.:format)      Pages#help
#   contact     /contact(.:format)   Pages#contact
#      root     /                    Pages#home
