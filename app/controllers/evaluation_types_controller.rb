class EvaluationTypesController < ApplicationController
  before_action :set_evaluation_type, only: [:show, :update, :destroy]

  # GET /evaluation_types
  # GET /evaluation_types.json
  def index
    @evaluation_types = EvaluationType.all

    render json: @evaluation_types
  end

  # GET /evaluation_types/1
  # GET /evaluation_types/1.json
  def show
    render json: @evaluation_type
  end

  # POST /evaluation_types
  # POST /evaluation_types.json
  def create
    @evaluation_type = EvaluationType.new(evaluation_type_params)

    if @evaluation_type.save
      render json: @evaluation_type, status: :created, location: @evaluation_type
    else
      render json: @evaluation_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evaluation_types/1
  # PATCH/PUT /evaluation_types/1.json
  def update
    @evaluation_type = EvaluationType.find(params[:id])

    if @evaluation_type.update(evaluation_type_params)
      head :no_content
    else
      render json: @evaluation_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /evaluation_types/1
  # DELETE /evaluation_types/1.json
  def destroy
    @evaluation_type.destroy

    head :no_content
  end

  private

    def set_evaluation_type
      @evaluation_type = EvaluationType.find(params[:id])
    end

    def evaluation_type_params
      params.require(:evaluation_type).permit(:name)
    end
end
