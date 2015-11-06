class SchoolClass < ActiveRecord::Base
  belongs_to :school
  belongs_to :user
  has_many :users

  has_many :evaluation_templates, dependent: :destroy
end
