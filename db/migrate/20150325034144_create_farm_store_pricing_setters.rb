class CreateFarmStorePricingSetters < ActiveRecord::Migration
  def change
    create_table :farm_store_pricing_setters do |t|
      t.integer :farm_store_pricing_id
      t.integer :farm_store_item_id

      t.timestamps null: false
    end
  end
end
