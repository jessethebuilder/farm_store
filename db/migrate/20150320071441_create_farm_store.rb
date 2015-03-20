class CreateFarmStore < ActiveRecord::Migration
  def change
    create_table :farm_stores do |t|
      t.string :takes_orders_type
      t.integer :takes_orders_id
      t.float :standard_tax_rate

      t.timestamps null: false
    end
  end
end
