class CreateFarmStoreOrders < ActiveRecord::Migration
  def change
    create_table :farm_store_orders do |t|
      t.text :items
      t.integer :makes_orders_id
      t.string :makes_orders_type
      t.string :phase
      t.text :billing_address
      t.text :shipping_address

      t.timestamps null: false
    end
  end
end
