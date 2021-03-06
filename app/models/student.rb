class Student < ActiveRecord::Base
  belongs_to :school
  belongs_to :teacher

  has_many :ratings
  has_and_belongs_to_many :school_classes
end
