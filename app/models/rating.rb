class Rating < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :student
end
