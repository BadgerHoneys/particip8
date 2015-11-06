class School < ActiveRecord::Base
  resourcify
  belongs_to :district
end
