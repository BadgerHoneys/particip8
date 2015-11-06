class Evaluation < ActiveRecord::Base
  belongs_to :evaluation_template
  has_many :ratings

  after_create :attendance

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