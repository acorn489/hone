class DomainsController < ApplicationController
  before_action :authenticate_user!

	def show
		@domain = Domain.friendly.find(params[:slug])
		@skills = @domain.skills
	end

	def game_store
		@domain = Domain.friendly.find(params[:slug])
		@games = @domain.unlocked_games(current_user)
	end
end
