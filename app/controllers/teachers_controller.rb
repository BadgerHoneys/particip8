class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :update, :destroy]
  before_action :set_teacher_id_class, only: [:classes]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all

    render json: @teachers
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    render json: @teacher
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      render json: @teacher, status: :created, location: @teacher
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      head :no_content
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy

    head :no_content
  end

  def classes
    render json: @teacher.school_classes
  end

  private

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def set_teacher_id_class
      @teacher = Teacher.find(params[:teacher_id])
    end

    def teacher_params
      params.require(:teacher).permit(:name, :email, :school_id, :password)
    end
end
