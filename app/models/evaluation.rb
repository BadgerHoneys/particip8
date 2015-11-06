class Evaluation < ActiveRecord::Base
  belongs_to :evaluation_template
  has_many :ratings

  validate :attendance_for_the_day

  after_create :attendance

  def attendance_for_the_day
    flag = false
    evaluation_template.school_class.current_days.reverse.each do |day|
      flag = true if day.created_at.to_date == Date.current
    end

  end

  def attendance
    evaluation_template.school_class.current_days.reverse.each do |day|
      if day.created_at.to_date == Date.current
        day.attendances.each do |attendance|
          Rating.create!(evaluation_id: id, rating_value: '100', user_id: attendance.user_id) if attendance.is_there
        end
        break
      end
    end
  end
end