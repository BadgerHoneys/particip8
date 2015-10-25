class EvaluationTemplatesController < ApplicationController
  before_action :set_evaluation_template, only: [:show, :update, :destroy]

  # GET /evaluation_templates
  # GET /evaluation_templates.json
  def index
    @evaluation_templates = EvaluationTemplate.all

    render json: @evaluation_templates
  end

  # GET /evaluation_templates/1
  # GET /evaluation_templates/1.json
  def show
    render json: @evaluation_template
  end

  # POST /evaluation_templates
  # POST /evaluation_templates.json
  def create

    @evaluation_template = EvaluationTemplate.new(evaluation_template_params)

    if @evaluation_template.save
      render json: @evaluation_template, status: :created, location: @evaluation_template
    else
      render json: @evaluation_template.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evaluation_templates/1
  # PATCH/PUT /evaluation_templates/1.json
  def update
    @evaluation_template = EvaluationTemplate.find(params[:id])

    if @evaluation_template.update(evaluation_template_params)
      head :no_content
    else
      render json: @evaluation_template.errors, status: :unprocessable_entity
    end
  end

  # DELETE /evaluation_templates/1
  # DELETE /evaluation_templates/1.json
  def destroy
    @evaluation_template.destroy

    head :no_content
  end

  private

    def set_evaluation_template
      @evaluation_template = EvaluationTemplate.find(params[:id])
    end

    def evaluation_template_params
      params.permit(:name, :school_class_id, :rating_type_id, :evaluation_type_id)
    end
end
