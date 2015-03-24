class CreateFarmStoreOrderItems < ActiveRecord::Migration
  def change
    create_table :farm_store_order_items do |t|
      t.integer :farm_store_order_id
      t.string :pricing_key
      t.float :quantity
      t.float :tax_rate
      t.string :name
      t.float :price

      t.timestamps null: false
    end
  end
end
