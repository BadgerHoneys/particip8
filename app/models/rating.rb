class Rating < ActiveRecord::Base
  belongs_to :evaluation, dependent: :destroy
  belongs_to :user, dependent: :destroy


end
