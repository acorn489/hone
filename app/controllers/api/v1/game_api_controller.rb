module Api
  module V1
    class GameApiController < BaseController
      before_action :doorkeeper_authorize!

      def complete_skill
        unless params[:skill_id].present?
          return render nothing: true, status: :bad_request
        end
        begin
          unless (state = StudentSkillState.find_by(:skill_id => params[:skill_id]) && state && state.completed)
            if state && !state.completed
              state.completed = true
              state.save
            else
              StudentSkillState.create(
                  :student_id => Student.find_by(:id => doorkeeper_token.resource_owner_id).id,
                  :skill_id => params[:skill_id],
                  :completed => true,
                  :collected => false
              )
            end
          end
        rescue ActiveRecord::RecordNotUnique
          # ignored
        end
        render nothing: true, status: :ok
      end

    end

  end

end

