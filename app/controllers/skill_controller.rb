class SkillController < ApplicationController
    def show
      current_student = Student.find(session['warden.user.user.key'][0][0])
      @skill = Skill.find(params[:id])
      @games = @skill.games
    end
end
