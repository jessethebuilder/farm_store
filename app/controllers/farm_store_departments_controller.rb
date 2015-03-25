class FarmStoreDepartmentsController < ApplicationController
  before_action :set_farm_store_department, only: [:show, :edit, :update, :destroy]

  # GET /farm_store_departments
  def index
    @farm_store_departments = FarmStoreDepartment.all
  end

  # GET /farm_store_departments/1
  def show
  end

  # GET /farm_store_departments/new
  def new
    @farm_store_department = FarmStoreDepartment.new
  end

  # GET /farm_store_departments/1/edit
  def edit
  end

  # POST /farm_store_departments
  def create
    @farm_store_department = FarmStoreDepartment.new(farm_store_department_params)

    if @farm_store_department.save
      redirect_to @farm_store_department, notice: 'Farm store department was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farm_store_departments/1
  def update
    if @farm_store_department.update(farm_store_department_params)
      redirect_to @farm_store_department, notice: 'Farm store department was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farm_store_departments/1
  def destroy
    @farm_store_department.destroy
    redirect_to farm_store_departments_url, notice: 'Farm store department was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_store_department
      @farm_store_department = FarmStoreDepartment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def farm_store_department_params
      params.require(:farm_store_department).permit(:name, :description)
    end
end
