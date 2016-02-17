class DomainsController < ApplicationController
	def show
		authorizeRole(Developer)
		@domain = Domain.find_by_id(params[:id])
		@skills = @domain.skills
	end

	def game_store
		authorizeRole(Student)
		@domain = Domain.find_by_id(params[:id])
		@games = @domain.unlocked_games(session[:user_id])
	end
end
