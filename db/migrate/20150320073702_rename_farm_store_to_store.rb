class RenameFarmStoreToStore < ActiveRecord::Migration
  def change
    rename_table :farm_stores, :stores
  end
end
