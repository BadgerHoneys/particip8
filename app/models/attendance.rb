class Attendance < ActiveRecord::Base
  belongs_to :current_day
  belongs_to :user
end
