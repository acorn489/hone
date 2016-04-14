class SkillController < ApplicationController
    def show
      @skill = Skill.find(params[:id])
      current_student = Student.find(session['warden.user.user.key'][0][0])
      @games = Game.all();
    end
end
