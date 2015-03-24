class FarmStoreOrderItemsController < ApplicationController
  # There is no db table for this model
  before_action :set_current_order
  before_action :set_farm_store_order_item, :only => [:destroy]

  respond_to :js

  def create
    @farm_store_order_item = FarmStoreOrderItem.new(farm_store_order_item_params)
    @current_order.farm_store_order_items << @farm_store_order_item

    # todo need to deal with situations where a page is rendered, but the Item has been deleted,


    # if @farm_store_order_item.save
    #
    # end
  end

  def destroy
    @farm_store_order_item.destroy
  end

  private

  def set_farm_store_order_item
    @farm_store_order_item = FarmStoreOrderItem.find(params[:id])
  end

  def farm_store_order_item_params
    params.require(:farm_store_order_item).permit(:farm_store_item_id, :pricing_key, :quantity, :price)
  end

  def set_current_order
    @current_order = current_order
  end
end

