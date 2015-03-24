class AddFarmStoreItemIdToFarmStoreOrderItem < ActiveRecord::Migration
  def change
    add_column :farm_store_order_items, :farm_store_item_id, :integer
  end
end
