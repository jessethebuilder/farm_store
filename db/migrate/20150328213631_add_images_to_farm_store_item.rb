class AddImagesToFarmStoreItem < ActiveRecord::Migration
  def change
    add_column :farm_store_items, :images, :text, :default => []
  end
end
