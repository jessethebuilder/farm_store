class CreateFarmStoreDepartmentSetters < ActiveRecord::Migration
  def change
    create_table :farm_store_department_setters do |t|
      t.integer :farm_store_department_id
      t.integer :farm_store_item_id

      t.timestamps null: false
    end
  end
end
