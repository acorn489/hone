class Game < ActiveRecord::Base
	has_many :scores
	has_many :students, :through => :scores
	has_many :unlocks
	has_many :students, :through => :unlocks
	belongs_to :primary_skill, :class_name => 'Skill', :foreign_key => 'primary_skill_id'
	belongs_to :secondary_skill, :class_name => 'Skill', :foreign_key => 'secondary_skill_id'

	validates :title, :description, :platform, :link, 
		:passing_score, :primary_skill_id, presence: true
end
