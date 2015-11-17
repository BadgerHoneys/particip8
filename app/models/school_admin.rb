class SchoolAdmin < User
  belongs_to :district

  has_many :schools
end
