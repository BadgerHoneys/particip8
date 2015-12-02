class District < ActiveRecord::Base
	has_one :admin
	has_many :schools
end
