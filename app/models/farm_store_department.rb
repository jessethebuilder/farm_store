class FarmStoreDepartment < ActiveRecord::Base
  has_many :farm_store_department_setters
  has_many :farm_store_items, through: :farm_store_department_setter

  validates :name, presence: true, uniqueness: true
end
