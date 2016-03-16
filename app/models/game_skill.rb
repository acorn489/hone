class GameSkill < ActiveRecord::Base
	belongs_to :game, dependent: :destroy
	belongs_to :skill, dependent: :destroy
end
