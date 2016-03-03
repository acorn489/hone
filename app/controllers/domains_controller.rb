class DomainsController < ApplicationController
	def show
		authorize_role(Developer)
		@domain = Domain.friendly.find(params[:slug])
		@skills = @domain.skills
	end

	def game_store
		authorize_role(Student)
		@domain = Domain.friendly.find(params[:slug])
		@games = @domain.unlocked_games(session[:user_id])
	end
end
