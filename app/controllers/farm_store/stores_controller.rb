# require_dependency "store/application_controller"
#
# module FarmStore
#   class StoresController < ApplicationController
#     before_action :set_farm_store, only: [:show, :edit, :update, :destroy]
#
#     # GET /Stores
#     def index
#       @stores = FarmStore.all
#     end
#
#     # GET /Stores/1
#     def show
#     end
#
#     # GET /Stores/new
#     def new
#       @store = FarmStore.new
#     end
#
#     # GET /Stores/1/edit
#     def edit
#     end
#
#     # POST /Stores
#     def create
#       @store = FarmStore.new(farm_store_params)
#
#       if @store.save
#         redirect_to @store, notice: 'Farm store was successfully created.'
#       else
#         render :new
#       end
#     end
#
#     # PATCH/PUT /Stores/1
#     def update
#       if @store.update(farm_store_params)
#         redirect_to @store, notice: 'Farm store was successfully updated.'
#       else
#         render :edit
#       end
#     end
#
#     # DELETE /Stores/1
#     def destroy
#       @store.destroy
#       redirect_to farm_stores_url, notice: 'Farm store was successfully destroyed.'
#     end
#
#     private
#       # Use callbacks to share common setup or constraints between actions.
#       def set_farm_store
#         @store = FarmStore.find(params[:id])
#       end
#
#       # Only allow a trusted parameter "white list" through.
#       def farm_store_params
#         params.require(:store).permit(:takes_orders_type, :takes_orders_id, :standard_tax_rate)
#       end
#   end
# end
