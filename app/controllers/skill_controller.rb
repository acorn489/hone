class SkillController < ApplicationController
  before_action :authenticate_student!
  def show
    current_student = Student.find_by(id: session['warden.user.user.key'][0][0])
    @skill = Skill.find_by(id: params[:id])
    @games = @skill.games
  end
end
