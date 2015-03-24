class CreateFarmStoreProfiles < ActiveRecord::Migration
  def change
    create_table :farm_store_profiles do |t|
      t.float :standard_tax_rate
      t.integer :has_farm_store_profile_id
      t.string :has_farm_store_profile_type

      t.timestamps null: false
    end
  end
end
