class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :update, :destroy]
  before_action :set_school_id, only: [:teachers]

  # GET /schools
  # GET /schools.json
  def index
    @school_list = @current_user.district.schools

    # binding.pry

    @schools = []

    @school_list.each do |school|
      this_school = {}
      this_school['name'] = school.name
      this_school['teachers'] = school.teachers.length
      this_school['students'] = school.students.length
      this_school['school_classes'] = school.school_classes.length
      this_school['id'] = school.id

      @schools.append(this_school)
    end

    render json: @schools
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    render json: @school, include: [:teachers, :school_classes, :students]
  end

  # GET /schools/1/teachers
  # GET /schools/1/teachers.json
  def teachers
    render json: @school.teachers
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    if @school.save
      render json: @school, status: :created, location: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      head :no_content
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy

    head :no_content
  end

  private

    def set_school
      @school = School.find(params[:id])
    end

    def set_school_id
      @school = School.find(params[:school_id])
    end

    def school_params
      params.require(:school).permit(:name, :district_id)
    end
end
