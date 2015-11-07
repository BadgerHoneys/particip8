class School < ActiveRecord::Base
  belongs_to :district
  has_many :school_classes
end
