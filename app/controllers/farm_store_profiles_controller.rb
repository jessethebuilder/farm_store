class FarmStoreProfilesController < ApplicationController
  before_action :set_farm_store_profile, only: [:show, :edit, :update, :destroy]

  # GET /farm_store_profiles
  def index
    @farm_store_profiles = FarmStoreProfile.all
  end

  # GET /farm_store_profiles/1
  def show
  end

  # GET /farm_store_profiles/new
  def new
    @farm_store_profile = FarmStoreProfile.new
  end

  # GET /farm_store_profiles/1/edit
  def edit
  end

  # POST /farm_store_profiles
  def create
    @farm_store_profile = FarmStoreProfile.new(farm_store_profile_params)

    if @farm_store_profile.save
      redirect_to @farm_store_profile, notice: 'Farm store profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farm_store_profiles/1
  def update
    if @farm_store_profile.update(farm_store_profile_params)
      redirect_to @farm_store_profile, notice: 'Farm store profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farm_store_profiles/1
  def destroy
    @farm_store_profile.destroy
    redirect_to farm_store_profiles_url, notice: 'Farm store profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_store_profile
      @farm_store_profile = FarmStoreProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def farm_store_profile_params
      params.require(:farm_store_profile).permit(:standard_tax_rate, :has_farm_store_profile_id, :has_farm_store_profile_type)
    end
end
