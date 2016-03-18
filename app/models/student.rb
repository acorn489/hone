class Student < User
  has_many :skills, :through => :student_skill_state
end
