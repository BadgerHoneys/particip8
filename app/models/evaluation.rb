class Evaluation < ActiveRecord::Base
  belongs_to :evaluation_template
  has_many :ratings

  #validate :attendance

  def attendance
    flag = false

    self.errors.add(:base, "Attendance Was Not Taken Today") unless flag
    flag
  end
end