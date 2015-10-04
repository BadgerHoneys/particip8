class DistrictsController < ApplicationController
  before_action :set_district, only: [:show, :update, :destroy]

  # GET /districts
  # GET /districts.json
  def index
    @districts = District.all

    render json: @districts
  end

  # GET /districts/1
  # GET /districts/1.json
  def show
    render json: @district
  end

  # POST /districts
  # POST /districts.json
  def create
    @district = District.new(district_params)

    if @district.save
      render json: @district, status: :created, location: @district
    else
      render json: @district.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /districts/1
  # PATCH/PUT /districts/1.json
  def update
    @district = District.find(params[:id])

    if @district.update(district_params)
      head :no_content
    else
      render json: @district.errors, status: :unprocessable_entity
    end
  end

  # DELETE /districts/1
  # DELETE /districts/1.json
  def destroy
    @district.destroy

    head :no_content
  end

  private

    def set_district
      @district = District.find(params[:id])
    end

    def district_params
      params.require(:district).permit(:name)
    end
end
