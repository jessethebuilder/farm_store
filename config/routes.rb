FarmStore::Engine.routes.draw do
  resources :farm_store_departments
  resources :farm_store_pricings
  resources :farm_store_profiles

  #todo these are hand drawn in the demo. Move to engine
  # resources :farm_store_order_items
  # resources :farm_store_items
  # resources :farm_store_orders
end
