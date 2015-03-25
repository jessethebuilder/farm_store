class CreateFarmStoreItems < ActiveRecord::Migration
  def change
    create_table :farm_store_items do |t|
      t.string :name
      t.text :description
      t.float :tax_rate

      t.integer :quantity
      t.string :quantity_label

      t.timestamps null: false
    end
  end
end
