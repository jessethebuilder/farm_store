class FarmStoreOrderItemsController < ApplicationController
  # There is no db table for this model
  before_action :set_current_order
  before_action :set_farm_store_order_item, :only => [:destroy, :update]

  respond_to :js

  def update
    @farm_store_order_item.update(farm_store_order_item_params)
  end

  def create
    @farm_store_order_item = FarmStoreOrderItem.new(farm_store_order_item_params)
    @current_order.farm_store_order_items << @farm_store_order_item
  end

  def destroy
    @deleted_farm_store_order_item_id = @farm_store_order_item.destroy.id
  end

  private

  def set_farm_store_order_item
    @farm_store_order_item = FarmStoreOrderItem.find(params[:id])
  end

  def farm_store_order_item_params
    params.require(:farm_store_order_item).permit(:farm_store_item_id, :quantity, :price, :farm_store_pricing_id)
  end

  def set_current_order
    @current_order = current_order
  end
end

