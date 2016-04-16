module Api
  module V1
    class GameApiController < BaseController
      before_action :doorkeeper_authorize!

      def complete_skill
        unless params[:skill_id].present?
          return render text: "skill_id argument missing.", status: :bad_request
        end
        unless doorkeeper_token.application.owner.skills.find_by(id: params[:skill_id])
          return render text: "The skill doesn't belong to this game.", status: :bad_request
        end
        unless CompletedStudentSkill.find_by(:skill_id => params[:skill_id])
          CompletedStudentSkill.create(
              :student_id => Student.find_by(:id => doorkeeper_token.resource_owner_id).id,
              :skill_id => params[:skill_id],
              :collected => false
          )
        end
        render nothing: true, status: :ok
      end

    end

  end

end

