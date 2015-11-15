class Course < ActiveRecord::Base
	has_many :domains
	has_many :levels
	has_many :students, :through => :levels

	#A method called on the first time a student enters the course page.
	#It initializes a level with value 1 for the student and unlocks the first level games for the student
	def enroll(student_id)
		student = Student.find_by_id(student_id)
		level = Level.new
		level.course = self
		level.student = student
		level.value = 1
		if level.save
			first_level_games = Array.new
			domains = self.domains
			domains.each do |domain|
				skills = domain.skills.where(:level => 1)
				skills.each do |skill|
					first_level_games += skill.primary_games
					first_level_games += skill.secondary_games
				end
			end
			first_level_games.each do |game|
				unlock = Unlock.new
				unlock.game = game
				unlock.student_id = student_id
				unlock.save
			end
		end
	end
end
