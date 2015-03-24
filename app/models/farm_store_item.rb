class FarmStoreItem < ActiveRecord::Base
  validates :name, :presence => true
  validates :pricing, :presence => true

  has_many :farm_store_order_items

  serialize :pricing, Hash

  def tax_rate
    rate = read_attribute(:tax_rate) || farm_store_standard_tax_rate
    rate * 0.01
  end

  def build_order_item(pricing_key, quantity: 1, price: nil)
    oi = FarmStoreOrderItem.new
    # Records the name, price, and tax_rate in case these things change between the time the order is built and
    # the actual transaction occurs. This is suited for models that will not change much after creation. If they
    # are going to change frequently, some sort of error throwing and catching will be necessary to prevent unwanted
    # transactions.

    oi.name = self.name
    oi.farm_store_item_id = self.id
    oi.tax_rate = self.tax_rate
    oi.pricing_key = pricing_key
    oi.quantity = quantity

    # Price can be sent as a parameter in cases where a price is displayed, but the model, and thus prices, may change.
    # Here, the price sent as an optional parameter takes precedence over the price in the model.
    # This is used in the controller to ensure the price the user sees is the price the users pays.
    oi.price = price || self.pricing[pricing_key]
    oi
  end
end
