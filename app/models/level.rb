class Level < ActiveRecord::Base
	belongs_to :student
	belongs_to :course

	validates :value, :student_id, :course_id, presence: true
	validates_uniqueness_of :student_id, scope: :course_id

	def level_up
		level.value += 1
		level.save
	end
end
