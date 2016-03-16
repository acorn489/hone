class Game < ActiveRecord::Base
	has_many :game_skills
	has_many :skills, :through => :game_skills, :foreign_key => 'game_id'

	validates :title, :description, :platform, :link, presence: true
end
