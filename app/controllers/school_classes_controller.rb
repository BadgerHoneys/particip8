class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: [:show, :update, :destroy]
  before_action :set_school_id_class, only: [:evaluation_templates, :students, :reports, :set_teacher, :remove_teacher]

  # GET /school_classes
  # GET /school_classes.json
  def index
    
    #returns 
    @school_classes = @current_user.school_classes

    #example of other cases
    #if @current_user.is_principal?
      #school_classes = SchoolClasses.all
    #end

    render json: @school_classes, include: [:evaluation_templates]
  end

  # GET /school_classes/1
  # GET /school_classes/1.json
  def show
    render json: @school_class, :include => [:students, :evaluation_templates => {:include => {:rating_type => {:only => :scale}}}]
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
    render json: @school_classes = @current_user.school.school_classes.reject{|school_class| school_class.teacher_id}

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
    
    #get the evaluation templates for this class
    evaluation_templates = @school_class.evaluation_templates

    #get the students for this class
    students = @school_class.students

    time_period = params[:time_period]


    report_data = {}
    report_data['evaluation_templates'] = evaluation_templates
    report_data['student_records'] = {}

    students.each do |student|

      student_record = {}
      student_record['name'] = student.name
      student_record['ratings'] = {}

      report_data['student_records'][student.id] = student_record

    end




    evaluation_templates.each do |template|

      #select the relevant ratings based on the time period filter
      case time_period
      when "day"
        ratings = template.ratings.where("ratings.created_at >= :created_date",
          {created_date: Date.current})
      when "week"
        ratings = template.ratings.where("ratings.created_at >= :created_date",
          {created_date: 1.week.ago})
      when "month"
        ratings = template.ratings.where("ratings.created_at >= :created_date",
          {created_date: 1.month.ago})
      else
        ratings = template.ratings
      end 

      student_ratings = {}

      ratings.each do |rating|
        (student_ratings[rating.student_id] ||= []).push(rating.rating_value)
      end

      student_ratings.keys.each do |student_id|
        values = student_ratings[student_id]
        value = values.inject{|sum, el| sum.to_f + el.to_f}.to_f / values.size

        report_data['student_records'][student_id]["ratings"][template.id] = value
      end

    end

    binding.pry

    # students = @school_class.students
    # if params[:time_line] == 'all'
    #   students.each do |student|
    #     student.ratings.each do |rating|
    #       ratings.push(rating)
    #     end
    #   end
    # elsif params[:time_line] == 'month'
    #   students.each do |student|
    #     student.ratings.each do |rating|
    #       ratings.push(rating) if rating.created_at.to_date > 1.month.ago
    #     end
    #   end
    # elsif params[:time_line] == 'week'
    #   students.each do |student|
    #     student.ratings.each do |rating|
    #       ratings.push(rating) if rating.created_at.to_date > 1.week.ago
    #     end
    #   end
    # elsif params[:time_line] == 'day'
    #   students.each do |student|
    #     student.ratings.each do |rating|
    #       ratings.push(rating) if rating.created_at.to_date == Date.current
    #     end
    #   end
    # end
    # render json: ratings


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
