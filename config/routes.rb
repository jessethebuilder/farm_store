FarmStore::Engine.routes.draw do
  # resource :farm_store

  resources :farm_store_order_items



  resources :farm_store_items
  resources :orders
end
