class Evaluation < ActiveRecord::Base
  belongs_to :evaluation_template
  has_many :ratings
end