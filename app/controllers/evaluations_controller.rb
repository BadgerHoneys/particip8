class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :update, :destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = Evaluation.all

    render json: @evaluations
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
    render json: @evaluation
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)

    if @evaluation.save
      render json: @evaluation, status: :created, location: @evaluation
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    @evaluation = Evaluation.find(params[:id])

    if @evaluation.update(evaluation_params)
      head :no_content
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy

    head :no_content
  end



  # POST /evaluations/:evaluation_id/add_rating
  # POST /evaluations/:evaluation_id/add_rating.json
  def add_rating

    binding.pry

    head :no_content
  end


  private

    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params.require(:evaluation).permit(:evaluation_template_id)
    end
end
