class CreateFarmStorePricings < ActiveRecord::Migration
  def change
    create_table :farm_store_pricings do |t|
      t.string :name
      t.float :price
      t.integer :quantity

      t.integer :farm_store_item_id

      t.timestamps null: false
    end
  end
end
