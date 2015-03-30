class FarmStorePricing < ActiveRecord::Base
  belongs_to :farm_store_item

  validates :name, presence: true

  validates :quantity, presence: true, numericality: {:greater_than_or_equal_to => 1, :only_integer => true}

  validates :price, presence: true, numericality: {:greater_than_or_equal_to => 0}

  def price
    read_attribute(:price).round(3) unless read_attribute(:price).nil?
  end

  def maximum_order_quantity(farm_store_item)
    Integer(farm_store_item.quantity / quantity)
  end
end
