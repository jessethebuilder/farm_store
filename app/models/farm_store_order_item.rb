class FarmStoreOrderItem
  attr_reader :name, :item_id, :price, :pricing_key, :quantity, :tax_rate

  def initialize(item, pricing_key, quantity, price: nil)
    @name = item.name
    @item_id = item.id
    @tax_rate = item.tax_rate
    @pricing_key = pricing_key
    # Price can be sent as a parameter in cases where a price is displayed, but the model, and thus prices, may change.
    # Here, the price sent as an optional parameter takes precedence over the price in the model.
    # This is used in the controller to ensure the price the user sees is the price the users pays.
    @price = price || item.pricing[pricing_key]
    @quantity = quantity
  end

  def item
    #where is used here, in case the item gets deleted after the order is saved. Nil would indicate that.
    FarmStoreItem.where(:id => @item_id).first
  end

  def total
    @price * @quantity
  end

  def total_after_tax
    #expects this constant to be defined.
    total * (1 + @tax_rate)
  end
end