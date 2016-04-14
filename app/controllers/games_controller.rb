class GamesController < ApplicationController
  before_action :authenticate_developer!

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    begin
      unless @game.save
        flash.now[:error] = @game.errors.full_messages.to_sentence
        return render :new
      end
    rescue Exceptions::GameSkillCreateFailed,
           Exceptions::OAuthApplicationCreateFailed => e
      flash.now[:error] = e.message
      return render :new
    end
    flash[:notice] = "You game has been successfully saved."
    redirect_to(:controller => home_controller, :action => 'show')
  end

  private
  def game_params
    params
        .require(:game)
        .permit(:title, :android_link, :ios_link, :web_link, :redirect_uri, :skills_list => [])
        .merge(developer_id: current_developer.id)
  end
end
