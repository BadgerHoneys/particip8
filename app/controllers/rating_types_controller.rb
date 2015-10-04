class RatingTypesController < ApplicationController
  before_action :set_rating_type, only: [:show, :update, :destroy]

  # GET /rating_types
  # GET /rating_types.json
  def index
    @rating_types = RatingType.all

    render json: @rating_types
  end

  # GET /rating_types/1
  # GET /rating_types/1.json
  def show
    render json: @rating_type
  end

  # POST /rating_types
  # POST /rating_types.json
  def create
    @rating_type = RatingType.new(rating_type_params)

    if @rating_type.save
      render json: @rating_type, status: :created, location: @rating_type
    else
      render json: @rating_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rating_types/1
  # PATCH/PUT /rating_types/1.json
  def update
    @rating_type = RatingType.find(params[:id])

    if @rating_type.update(rating_type_params)
      head :no_content
    else
      render json: @rating_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rating_types/1
  # DELETE /rating_types/1.json
  def destroy
    @rating_type.destroy

    head :no_content
  end

  private

    def set_rating_type
      @rating_type = RatingType.find(params[:id])
    end

    def rating_type_params
      params.require(:rating_type).permit(:name, :scale)
    end
end
