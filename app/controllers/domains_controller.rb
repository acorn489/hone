class DomainsController < ApplicationController
	def show
		authorize_role(Developer)
		@domain = Domain.find_by_id(params[:id])
		@skills = @domain.skills
	end

	def game_store
		authorize_role(Student)
		@domain = Domain.find_by_id(params[:id])
		@games = @domain.unlocked_games(session[:user_id])
	end
end
