class District < ActiveRecord::Base
  resourcify
  has_many :school_classes
end
