class FarmStoreItem < ActiveRecord::Base
  validates :name, :presence => true

  has_many :farm_store_pricing_setters
  has_many :farm_store_pricings, through: :farm_store_pricing_setters

  has_many :farm_store_department_setters
  has_many :farm_store_departments, through: :farm_store_department_setters

  has_many :farm_store_order_items

  validates :quantity, :presence => true, :numericality => {:greater_than_or_equal_to => 0}

  def tax_rate
    rate = read_attribute(:tax_rate) || farm_store_standard_tax_rate
    rate * 0.01
  end

  def farm_store_pricing_id=(id)
    farm_store_pricings << FarmStorePricing.find(id)
  end

  def build_order_item(pricing, quantity: 1, price: nil)
    oi = FarmStoreOrderItem.new

    oi.farm_store_item = self
    oi.farm_store_pricing = pricing

    # Records the name, price, and tax_rate in case these things change between the time the order is built and
    # the actual transaction occurs. This is suited for models that will not change much after creation. If they
    # are going to change frequently, some sort of error throwing and catching will be necessary to prevent unwanted
    # transactions.

    oi.name = self.name
    oi.tax_rate = self.tax_rate
    oi.quantity = quantity
    oi.pricing_quantity = pricing.quantity

    # Price can be sent as a parameter in cases where a price is displayed, but the model, and thus prices, may change.
    # Here, the price sent as an optional parameter takes precedence over the price in the model.
    # This is used in the controller to ensure the price the user sees is the price the users pays.
    oi.price = price || pricing.price
    oi
  end

  #------------------------Class Methods-----------------------

  scope :in_stock, ->{ where('quantity > ?', 0) }
  scope :out_of_stock, ->{ where(:quantity => 0) }
end
