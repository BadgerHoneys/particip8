class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: [:show, :update, :destroy]
  before_action :set_school_id_class, only: [:evaluation_templates, :students]

  # GET /school_classes
  # GET /school_classes.json
  def index
    
    #if the user is a teacher, return all of their school classes
    if @current_user.is_teacher?
      @school_classes = @current_user.school_classes
    end

    #example of other cases
    #if @current_user.is_principal?
      #school_classes = SchoolClasses.all
    #end

    render json: @school_classes, include: [:evaluation_templates]
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
    render json: @school_class.user
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
