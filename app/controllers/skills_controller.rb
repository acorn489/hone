class SkillsController < ApplicationController
	def show
		@skill = Skill.friendly.find(params[:id])
		@primary_games = @skill.primary_games
		@secondary_games = @skill.secondary_games
	end
end
