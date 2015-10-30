class Evaluation < ActiveRecord::Base
  belongs_to :evaluation_template
  has_many :ratings

  after_create :create_student_ratings
end