class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: [:show, :update, :destroy]
  before_action :set_school_id_class, only: [:evaluation_templates, :students, :reports, :add_teacher, :remove_teacher]

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

  def available
    @school_classes = @current_user.school.school_classes.reject{|school_class| school_class.teacher_id}
  end

  def evaluation_templates
    render json: @school_class.evaluation_templates
  end

  def students
    render json: @school_class.students
  end

  #adds the current teacher to the class
  def set_teacher
    @school_class.teacher = @current_user
    
    if @school_class.save
      head :no_content
    else
      render json: @school_class.errors, status: :unprocessable_entity
    end
  end

  #removes the teacher from the class
  def remove_teacher
    @school_class.teacher = nil

    if @school_class.save
      head :no_content
    else
      render json: @school_class.errors, status: :unprocessable_entity
    end
  end

  #Returns reports for the class
  def reports
    ratings = []
    students = @school_class.students
    if params[:time_line] == 'all'
      students.each do |student|
        student.ratings.each do |rating|
          ratings.push(rating)
        end
      end
    elsif params[:time_line] == 'month'
      students.each do |student|
        student.ratings.each do |rating|
          ratings.push(rating) if rating.created_at.to_date > 1.month.ago
        end
      end
    elsif params[:time_line] == 'week'
      students.each do |student|
        student.ratings.each do |rating|
          ratings.push(rating) if rating.created_at.to_date > 1.week.ago
        end
      end
    elsif params[:time_line] == 'day'
      students.each do |student|
        student.ratings.each do |rating|
          ratings.push(rating) if rating.created_at.to_date == Date.current
        end
      end
    end
    render json: ratings
  end


  private

    def set_school_class
      @school_class = SchoolClass.find(params[:id])
    end

    def set_school_id_class
      @school_class = SchoolClass.find(params[:school_class_id])
    end

    def school_class_params
      params.require(:school_class).permit(:school_id, :teacher_id, :name, :start_time, :end_time)
    end


end
