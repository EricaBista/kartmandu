Rails.application.routes.draw do

  root 'home#index'

  resources :payment_notifications
  resources :lines_items
  resources :orders
  resources :contacts
  resources :wishlists
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :brands
  resources :items
  resources :categories

  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  post 'item/addtocart' => 'cart#add', :as => "add_cart"
  get '/item/buy/:id', :controller => "items", :action => "buy", :as => 'buy'
  get 'item/:slug', :controller => "items", :action => "show", :as =>'slugged'
  post '/search' => 'items#search'
  get 'details/:slug', :controller => "categories", :action => "list_items", :as =>'list_items_show'
  get 'list/:slug', :controller => "brands", :action => "list_brand_items", :as =>'list_brand_items_show'
  get 'cms/:slug', :controller => "contacts", :action => "cms", :as => 'contact_show'
  get '/order/checkout', :controller => "orders", :action => "express_checkout", :as => 'express_checkout'

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
