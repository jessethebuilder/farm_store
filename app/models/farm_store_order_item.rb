class FarmStoreOrderItem < ActiveRecord::Base
  belongs_to :farm_store_item
  belongs_to :farm_store_order
  belongs_to :farm_store_pricing

  validates :farm_store_pricing_id, :presence => true
  validates :farm_store_item_id, :presence => true

  def total
    price * quantity
  end

  def total_after_tax
    #expects this constant to be defined.
    total * (1 + tax_rate)
  end
end