class FarmStorePricingSetter < ActiveRecord::Base
  belongs_to :farm_store_pricing
  belongs_to :farm_store_item
end
