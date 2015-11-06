class CurrentDay < ActiveRecord::Base
  belongs_to :school_class
  has_many :attendances

  after_create :initial_attendance

  def initial_attendance
    students = User.with_role :student, school_class
    students.each do |student|
      Attendance.create!(current_day_id: id, user_id: student.id, is_there: true)
    end
  end
end
