class Evaluation < ActiveRecord::Base
  belongs_to :evaluation_template
  has_many :ratings

  after_create :create_student_ratings

  def create_student_ratings
    ratings = []
    evaluation_template.school_class.students.each do |student|
      ratings.push(self.ratings.build(student_id: student, rating_value: "100"))
    end
    #something redis sends info
  end
end