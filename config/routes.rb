Rails.application.routes.draw do
  
  
  
  resources :contacts
  resources :wishlists
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :brands
  resources :items
  resources :categories
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add', :as => "add_cart"
# get '/brand/items/:id', :controller => "brands", :action => "list", :as => "brand_list"
 get '/item/buy', :controller => "items", :action => "buy", :as => 'buy'
 get 'item/:slug', :controller => "items", :action => "show", :as =>'slugged'
 post '/search' => 'items#search'
 get 'details/:slug', :controller => "categories", :action => "list_items", :as =>'list_items_show'
 get 'list/:slug', :controller => "brands", :action => "list_brand_items", :as =>'list_brand_items_show'
  # get 'wish/:item_id', :controller => "wishlists", :action => "add", :as =>'wishes_show'
   get 'cms/:slug', :controller => "contacts", :action => "cms", :as => 'contact_show'

  # You can have the root of your site routed with "root"
   root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products


devise_scope :admin_user do
    get '/admin/logout', :to => 'active_admin/devise/sessions#destroy'
end


  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
