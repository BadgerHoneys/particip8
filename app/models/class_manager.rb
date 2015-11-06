class ClassManager < ActiveRecord::Base
  belongs_to :school_class
  belongs_to :user
end
