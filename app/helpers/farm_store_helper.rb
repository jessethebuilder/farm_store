module FarmStoreHelper
  def farm_store_add_to_order_link(item, pricing, remote: true)
    link_to "#{pricing.name}: <strong>#{pricing.price}</strong>".html_safe,
            farm_store_order_items_path(:farm_store_order_item =>
                                          {:farm_store_item_id => item.id, :farm_store_pricing_id => pricing.id, :price => pricing.price}),
            method: :post, remote: remote

    # link_to 'xxx', farm_store_order_items_path, :method => :post
  end

  def farm_store_add_to_order_links(item)
    a = []
    item.farm_store_pricings.each do |p|
      a << farm_store_add_to_order_link(item, p)
    end
    a
  end
end