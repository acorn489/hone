module Api
  module V1
    class GameApiController < BaseController
      before_action :doorkeeper_authorize!

      def complete_skill
        unless params[:skill_id].present?
          return render nothing: true, status: :bad_request
        end
        begin
          GameSkill.create(:game_id => current_resource_owner.id, :skill_id => params[:skill_id])
        rescue ActiveRecord::RecordNotUnique
          # ignored
        end
        render nothing: true, status: :ok
      end

    end

  end

end

