class DomainsController < ApplicationController
	def show
		authenticate(Developer)
		@domain = Domain.find_by_id(params[:id])
		@skills = @domain.skills
	end

	def game_store
		authenticate(Student)
		@domain = Domain.find_by_id(params[:id])
		@games = @domain.unlocked_games(session[:user_id])
	end
end
