class CurrentDaysController < ApplicationController
  before_action :set_current_day, only: [:show, :update, :destroy]

  # GET /current_days
  # GET /current_days.json
  def index
    @current_days = CurrentDay.all

    render json: @current_days
  end

  # GET /current_days/1
  # GET /current_days/1.json
  def show
    render json: @current_day
  end

  # POST /current_days
  # POST /current_days.json
  def create
    @current_day = CurrentDay.new(current_day_params)

    if @current_day.save
      render json: @current_day, status: :created, location: @current_day
    else
      render json: @current_day.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /current_days/1
  # PATCH/PUT /current_days/1.json
  def update
    @current_day = CurrentDay.find(params[:id])

    if @current_day.update(current_day_params)
      head :no_content
    else
      render json: @current_day.errors, status: :unprocessable_entity
    end
  end

  # DELETE /current_days/1
  # DELETE /current_days/1.json
  def destroy
    @current_day.destroy

    head :no_content
  end

  private

    def set_current_day
      @current_day = CurrentDay.find(params[:id])
    end

    def current_day_params
      params.require(:current_day).permit(:day, :school_class_id)
    end
end