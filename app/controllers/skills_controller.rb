class SkillsController < ApplicationController
	def show
		@skill = Skill.friendly.find(params[:id])
		@games = @skill.games
	end
end
