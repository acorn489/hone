class GamesController < ApplicationController
  before_action :authenticate_developer!

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    skills.each do |item|
      GameSkill.create(:game_id => @game.id, :skill_id => item)
    end
    redirect_to :action => 'new'
  end

  private
  def game_params
    params.require(:game).permit(:title, :android_link, :ios_link, :web_link)
  end

  def skills
    params[:skillBox]
  end
end
