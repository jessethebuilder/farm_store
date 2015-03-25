class CreateFarmStoreOrderItems < ActiveRecord::Migration
  def change
    create_table :farm_store_order_items do |t|
      t.integer :farm_store_order_id
      t.integer :farm_store_item_id
      t.integer :farm_store_pricing_id

      t.integer :quantity
      t.float :tax_rate
      t.string :name
      t.float :price
      t.integer :pricing_quantity

      t.timestamps null: false
    end
  end
end
