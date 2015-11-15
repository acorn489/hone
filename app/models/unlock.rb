class Unlock < ActiveRecord::Base
	belongs_to :student
	belongs_to :game

	validates :student_id, :game_id, presence: true
	validates_uniqueness_of :student_id, scope: :game_id

end
