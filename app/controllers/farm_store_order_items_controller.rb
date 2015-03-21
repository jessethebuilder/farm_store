class FarmStoreOrderItemsController < ApplicationController
  # There is no db table for this model

  #expects there to be a method called set_current_order in scope
  before_action :set_current_order

  responds_to :js

  def create
    @current_order.items << @farm_store_order_item
    @current_order.save
  end

  def set_farm_store_order_item
    @farm_store_order_item = FarmStoreOrderItem.new(FarmStoreItem.find(params[:item_id]),
                                                    params[:pricing_key], params[:quantity],
                                                    :price => params[:price])

  end

  def farm_store_params
    params.require(:farm_store_order_item).permit(:item_id, :pricing_key, :quantity, :price)
  end
end