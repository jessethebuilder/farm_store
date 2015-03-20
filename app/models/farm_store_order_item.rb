class FarmStoreOrderItem < Struct.new(:item_id, :pricing_key, :quantity)
  def item
    FarmStoreItem.find(item_id)
  end

  def price
    item.pricing[pricing_key] * quantity
  end

  def price_after_tax
    #expects this constant to be defined.
    price * item.tax_rate
  end
end