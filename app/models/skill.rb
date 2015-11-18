class Skill < ActiveRecord::Base
	belongs_to :domain
	has_many :passes
	has_many :students, :through => :passes
	has_many :primary_games, :class_name => 'Game', :foreign_key => 'primary_skill_id'
	has_many :secondary_games, :class_name => 'Game', :foreign_key => 'secondary_skill_id'

	after_create :initialize_course_id

	validates :title, :description, :grade, presence: true

	def initialize_course_id
		self.update_attributes(:course_id => self.domain.course.id)
	end

	def level_passed(student_id)
		student = Student.find_by_id(student_id)
		number_of_passes = student.skills.count :conditions => {:course_id => self.course_id, 
			:level => self.level}
		number_of_skills = Skill.where(:course_id => self.course_id, 
			:level => self.level).count
		return number_of_skills == number_of_passes
	end

	def grade_passed(student_id)
		student = Student.find_by_id(student_id)
		number_of_passes = student.skills.count :conditions => {:course_id => self.course_id, 
			:grade => self.grade}
		number_of_skills = Skill.where(:course_id => self.course_id, 
			:grade => self.grade).count
		return number_of_skills == number_of_passes
	end
	def domain_passed(student_id)
		student = Student.find_by_id(student_id)
		number_of_passes = student.skills.count :conditions => {:course_id => self.course_id, 
			:domain_id => self.domain_id, :grade => self.grade}
		number_of_skills = Skill.where(:course_id => self.course_id, 
			:domain_id => self.domain_id, :grade => self.grade).count
		return number_of_skills == number_of_passes
	end

	def unlock_games
		unlocked_games = self.primary_games
		unlocked_games += self.secondary_games
		unlocked_games.each do |game|
			unlock = Unlock.new
			unlock.game = game
			unlock.student_id = 1
			unlock.save
		end
	end

	def unlock_level_games
		unlocked_level += self.level
		unlocked_grade += self.grade
		unlocked_skills = Skills.where(:course_id => self.course_id, :grade => unlocked_grade,
			:level => unlocked_level)
		unlocked_skills.each do |skill|
			skill.unlocked_games
		end
	end

	def unlock_domain_games
		unlocked_level += self.level
		unlocked_grade += self.grade
		unlocked_skills = Skills.where(:course_id => self.course_id, domain_id => self.domain_id,
			:grade => unlocked_grade, :level => unlocked_level)
		unlocked_skills.each do |skill|
			skill.unlocked_games
		end
	end

	def unlock_dependency_games
		unlocked_skill = Skill.where(:id => self.locked_skill_id).first
		unlocked_skill.unlock_games
	end
end
