class SchoolClass < ActiveRecord::Base
  belongs_to :school
  belongs_to :teacher

  has_many :evaluation_templates, dependent: :destroy
  has_and_belongs_to_many :students
  has_and_belongs_to_many :teachers
end
