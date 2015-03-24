class RemoveItemsFromFarmStoreOrder < ActiveRecord::Migration
  def change
    remove_column :farm_store_orders, :items, :text
  end
end
