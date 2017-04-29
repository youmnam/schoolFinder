Rails.application.routes.draw do
  resources :renters
  resources :item_attachments
  get 'sessions/new'

  resources :categorys do
  resources :category_filters
  end
  
  get 'home/index'
  root 'home#index'
  resources :users do
      resources :items 
  end
  
resources :reservations

  patch   '/uploadlogo',      to: 'users#uploadlogo'

  get     '/markavailable',   to: 'items#markavailable'
  get	    '/showcat',         to: 'category_items#show'
  get     '/viewitem',        to: 'items#index'
  get     '/changeStatus',    to: 'reservations#changeStatus'

  get     '/login',           to: 'sessions#new'
  post    '/login',           to: 'sessions#create'
  get     '/loginrenter',     to: 'sessions#loginrenter'
  post    '/loginrenter',     to: 'sessions#createrenter'
  post    '/searchItems',     to: 'category_items#searchCat'
  delete  '/logout',          to: 'sessions#destroy'


namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get     "/getAllCategories",     to: "api#getAllCategories"
      get     "/getItems",             to: "api#getItems"
      get     "/getItemInfo",          to: "api#getItemInfo"
      get     "/getVendorInfo",        to: "api#getVendorInfo"
      get     "/getCategoryFilter",      to: "api#getCategoryFilter"
      
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
