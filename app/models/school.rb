class School < ActiveRecord::Base
  belongs_to :district
  has_many :school_classes
  has_many :teachers
  has_many :students
end
