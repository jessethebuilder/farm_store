class FarmStorePricingsController < ApplicationController
  before_action :set_farm_store_pricing, only: [:show, :edit, :update, :destroy]

  # GET /farm_store_pricings
  def index
    @farm_store_pricings = FarmStorePricing.all
  end

  # GET /farm_store_pricings/1
  def show
  end

  # GET /farm_store_pricings/new
  def new
    @farm_store_pricing = FarmStorePricing.new
  end

  # GET /farm_store_pricings/1/edit
  def edit
  end

  # POST /farm_store_pricings
  def create
    @farm_store_pricing = FarmStorePricing.new(farm_store_pricing_params)

    if @farm_store_pricing.save
      redirect_to @farm_store_pricing, notice: 'Farm store pricing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farm_store_pricings/1
  def update
    if @farm_store_pricing.update(farm_store_pricing_params)
      redirect_to @farm_store_pricing, notice: 'Farm store pricing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farm_store_pricings/1
  def destroy
    @farm_store_pricing.destroy
    redirect_to farm_store_pricings_url, notice: 'Farm store pricing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_store_pricing
      @farm_store_pricing = FarmStorePricing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def farm_store_pricing_params
      params.require(:farm_store_pricing).permit(:name, :price, :quantity)
    end
end
