class FarmStoreOrderItem < ActiveRecord::Base
  belongs_to :farm_store_item
  belongs_to :farm_store_order
  belongs_to :farm_store_pricing

  validates :farm_store_pricing_id, :presence => true
  validates :farm_store_item_id, :presence => true
  validates :quantity, :presence => true, :numericality => {greater_than_or_equal_to: 0, only_integer: true}

  validate :quantity_exists

  def quantity_exists
    errors.add(:total_quantity, 'is no longer in stock') if total_quantity > farm_store_item.quantity
  end

  def total
    price * quantity
  end

  def total_after_tax
    #expects this constant to be defined.
    total * (1 + tax_rate)
  end

  def total_quantity
    #this is the number of units that should be removed from the inventory.
    pricing_quantity * quantity
  end
end