class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: [:show, :update, :destroy]
  before_action :set_school_id_class, only: [:evaluation_templates, :students, :add_student]

  # GET /school_classes
  # GET /school_classes.json
  def index
    render json: @school_classes
  end

  # GET /school_classes/1
  # GET /school_classes/1.json
  def show
    render json: @school_class, include: [:evaluation_templates, :students]
  end

  # POST /school_classes
  # POST /school_classes.json
  def create
    @school_class = SchoolClass.new(school_class_params)
    if @school_class.save
      user = User.find(params[:school_class][:user_id])
      user.add_role :teacher, @school_class
      render json: @school_class, status: :created, location: @school_class
    else
      render json: @school_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /school_classes/1
  # PATCH/PUT /school_classes/1.json
  def update
    @school_class = SchoolClass.find(params[:id])

    if @school_class.update(school_class_params)
      head :no_content
    else
      render json: @school_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /school_classes/1
  # DELETE /school_classes/1.json
  def destroy
    @school_class.destroy
    head :no_content
  end

  def evaluation_templates
    render json: @school_class.evaluation_templates
  end

  def students
    students = User.with_role :student, @school_class
    render json: students
  end

  def add_student
    student = User.find(params[:user_id])
    student.add_role :student, @school_class
  end

  private

  def set_school_class
    @school_class = SchoolClass.find(params[:id])
  end

  def set_school_id_class
    @school_class = SchoolClass.find(params[:school_class_id])
  end

  def school_class_params
    params.require(:school_class).permit(:school_id, :user_id, :name, :start_time, :end_time)
  end
end