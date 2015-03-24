FarmStore::Engine.routes.draw do
  resources :farm_store_profiles
  resources :farm_store_order_items
  # resource :farm_store

  resources :farm_store_order_items



  resources :farm_store_items
  resources :orders
end
