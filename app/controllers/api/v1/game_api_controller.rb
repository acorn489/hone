module Api
  module V1
    class GameApiController < BaseController
      before_action :doorkeeper_authorize!

      def complete_skill
        unless params[:skill_id].present?
          return render nothing: true, status: :bad_request
        end
        begin
          unless CompletedStudentSkills.find_by(:skill_id => params[:skill_id])
            CompletedStudentSkills.create(
                :student_id => Student.find_by(:id => doorkeeper_token.resource_owner_id).id,
                :skill_id => params[:skill_id],
                :collected => false
            )
          end
        rescue ActiveRecord::RecordNotUnique
          # ignored
        end
        render nothing: true, status: :ok
      end

    end

  end

end

