class DeveloperController < ApplicationController
  before_action :authenticate_developer!

  def show
    @games = Game.where(:developer_id => current_developer.id)
  end
end
