class Rating < ActiveRecord::Base
  belongs_to :evaluation, dependent: :destroy
  belongs_to :student, dependent: :destroy
end
