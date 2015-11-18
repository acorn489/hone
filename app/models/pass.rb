class Pass < ActiveRecord::Base
	belongs_to :student
	belongs_to :skill

	validates :student_id, :skill_id, presence: true
	validates_uniqueness_of :student_id, scope: :skill_id
end
