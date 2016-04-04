class GamesController < ApplicationController
  before_action :authenticate_developer!

  def new
    # @skill = Skill.friendly.find(params[:skill])
    @game = Game.new
  end

  def create
    # @skill = Skill.friendly.find(params.require(:game).permit(:skill)[:skill])
    @game = Game.create(game_params)
    redirect_to :action => 'new'
    # if @game.save
    #   # GameSkill.create(game_id: @game.id, skill_id: @skill.id)
    #   flash[:notice] = "Game Added"
    #   # redirect_to @game.skills[0] # TODO: support adding a game with more than one skill
    # else
    #   flash[:notice] = "Please fill in all fields."
    #   redirect_to :action => 'new', :skill => @skill.slug
    # end
  end

  private
  def game_params
    params.require(:game).permit(:title)
  end
end
