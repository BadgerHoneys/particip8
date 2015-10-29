class EvaluationTemplate < ActiveRecord::Base
  belongs_to :school_class
  belongs_to :rating_type
  has_many :evaluations, dependent: :destroy
end
