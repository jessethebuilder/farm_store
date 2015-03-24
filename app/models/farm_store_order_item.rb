class FarmStoreOrderItem < ActiveRecord::Base
  belongs_to :farm_store_item
  belongs_to :farm_store_order
  # attr_accessor :name, :item_id, :price, :pricing_key, :quantity, :tax_rate
  # attr_accessible :name, :item_id, :price, :pricing_key, :quantity, :tax_rate
  #
  # def FarmStoreOrderItem.build_from_hash(h)
  #   oi = self.new
  #   h.each{ |k, v| oi.send("#{k}=", v) }
  #   oi
  # end
  #
  # def item
  #   #where is used here, in case the item gets deleted after the order is saved. Nil would indicate that.
  #   FarmStoreItem.where(:id => @item_id).first
  # end

  def total
    price * quantity
  end

  def total_after_tax
    #expects this constant to be defined.
    total * (1 + tax_rate)
  end
end