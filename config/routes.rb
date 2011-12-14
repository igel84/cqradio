InitialRelease::Application.routes.draw do

  resources :cards

  match '/card_clear/(:id)' => 'card_items#card_clear', :as => 'card_clear'
  match '/card_conversion/:act/:id' => 'card_items#card_conversion', :as => 'card_conversion'
  resources :card_items

  match '/login' => 'account#login', :as => 'login'
  match '/logout' => 'account#logout', :as => 'logout'
  match '/authenticate' => 'account#authenticate', :as => 'authenticate'

  match '/find/:text' => 'pages#find'

  resources :users
  resources :pages

  match '/move_menu/:id/:position' => 'menus#move', :as => 'move_menu'
  match '/visible_menu/:id/:value' => 'menus#visible', :as => 'visible_menu'
  match '/move_product/:id/:position' => 'products#move', :as => 'move_product'
  match '/del_image_product/:id/:image' => 'products#del_image', :as => 'del_image_product'

  match '/product_info/:id' => 'pages#product_info', :as => 'product_info'
  match '/category/(:id)' => 'pages#category', :as => 'category'

  resources :products
  resources :menus

  root :to => 'pages#show', :id => 1

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
