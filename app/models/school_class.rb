class SchoolClass < ActiveRecord::Base
  belongs_to :school
  belongs_to :teacher

  has_many :evaluation_templates
end
