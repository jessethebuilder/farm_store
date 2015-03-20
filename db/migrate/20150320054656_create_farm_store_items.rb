class CreateFarmStoreItems < ActiveRecord::Migration
  def change
    create_table :farm_store_items do |t|
      t.string :name
      t.text :pricing
      t.text :description
      t.float :tax_rate

      t.timestamps null: false
    end
  end
end
