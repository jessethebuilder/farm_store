class FarmStoreOrderItem < Struct.new(:item_id, :pricing_key, :quantity)
  def item
    FarmStoreItem.find(@item_id)
  end

  def price
    item.pricing[@pricing_key] * @quantity
  end
end