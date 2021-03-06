class FarmStoreItemsController < ApplicationController
  # include FarmTools::MountableImagesControllersHelper

  # @mountable_images.each do |img|
  #   images << MountableImage.new(:image => img)
  # end
  #
  # @mountable_images_urls.each do |url|
  #   images << MountableImage.new(:remote_image_url => url)
  # end


  before_action :set_farm_store_item, only: [:show, :edit, :update, :destroy]

  # GET /farm_store_items
  def index
    @farm_store_items = FarmStoreItem.all
  end
  # GET /farm_store_items/1
  def show
  end
  # GET /farm_store_items/new
  def new
    @farm_store_item = FarmStoreItem.new
    5.times do
    @farm_store_item.farm_store_pricings.new
    end
  end

  # GET /farm_store_items/1/edit
  def edit
  end
  # POST /farm_store_items
  def create
    @farm_store_item = FarmStoreItem.new(farm_store_item_params)

    # @farm_store_item.mountable_images << mountable_images

    if @farm_store_item.save
      redirect_to @farm_store_item, notice: 'Farm store item was successfully created.'
    else
      # @lost_item_images = @farm_store_item.mountable_images
      render :new
    end
  end
  # PATCH/PUT /farm_store_items/1
  def update
    if @farm_store_item.update(farm_store_item_params)
      redirect_to @farm_store_item, notice: 'Farm store item was successfully updated.'
    else
      render :edit
    end
  end
  # DELETE /farm_store_items/1

  def destroy
    @farm_store_item.destroy
    redirect_to farm_store_items_url, notice: 'Farm store item was successfully destroyed.'
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_farm_store_item
    @farm_store_item = FarmStoreItem.find(params[:id])
  end
  # Only allow a trusted parameter "white list" through.
  def farm_store_item_params
    params.require(:farm_store_item).permit(:name, :description, :quantity, :farm_store_pricing_id, :quantity_label,
                                            {:mountable_images => []}, {:mountable_images_cache => []}, :remote_mountable_images_urls,
                                            {:farm_store_pricing_attributes => [:name, :quantity, :price]})
  end
end
