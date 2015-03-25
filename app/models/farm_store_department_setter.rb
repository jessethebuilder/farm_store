class FarmStoreDepartmentSetter < ActiveRecord::Base
  belongs_to :farm_store_item
  belongs_to :farm_store_department
end
