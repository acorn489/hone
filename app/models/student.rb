class Student < User
  has_many :skills, :through => :CompletedStudentSkills
end
