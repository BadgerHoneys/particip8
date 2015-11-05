class SchoolClass < ActiveRecord::Base
  belongs_to :school
  belongs_to :teacher

  has_many :evaluation_templates, dependent: :destroy
  has_and_belongs_to_many :students
  has_and_belongs_to_many :teachers

  after_create :create_attendance_eval

  def create_attendance_eval
    rating_type = RatingType.create!(name: 'Attendance', scale: '0-1')
    EvaluationTemplate.create!(name: 'Attendance', school_class_id: id, rating_type_id: rating_type.id)
  end
end
