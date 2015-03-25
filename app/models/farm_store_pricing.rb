class FarmStorePricing < ActiveRecord::Base
  has_many :farm_store_pricing_setters
  has_many :farm_store_items, through: :farm_store_pricing_setters

  validates :name, presence: true

  validates :quantity, presence: true, numericality: {:greater_than_or_equal_to => 0, :only_integer => true}

  validates :price, presence: true, numericality: {:greater_than_or_equal_to => 0}

  def price
    read_attribute(:price).round(3) unless read_attribute(:price).nil?
  end
end
