class Teacher < User
  belongs_to :school
  has_many :school_classes

  def is_teacher?
  	true
  end

end
