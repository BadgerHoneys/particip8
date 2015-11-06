class SchoolClass < ActiveRecord::Base
  resourcify
  belongs_to :school
  belongs_to :user
  has_many :users
  has_many :current_days
  has_many :evaluation_templates, dependent: :destroy
end
