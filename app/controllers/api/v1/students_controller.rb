module Api
  module V1
    class StudentsController < BaseController
      before_action :authenticate_user

      def skills

        unless params[:course_id].present?
          return render nothing: true, status: :bad_request
        end

        if current_student
          render :json =>
            Skill
              .joins(
                'LEFT JOIN student_skill_states ON student_skill_states.skill_id = skills.id AND student_skill_states.student_id = ' +
                  ActiveRecord::Base.sanitize(session['warden.user.user.key'][0][0])
              )
              .select(
                'student_skill_states.*',
                'skills.*'
              )
              .where(
                ['skills.course_id = ?', params[:course_id]]
              )
              .map {
                |skill| {
                  :id => skill.id,
                  :grade => skill.grade,
                  :title => skill.title,
                  :domain_id => skill.domain_id,
                  :completed => skill.completed?,
                  :collected => skill.collected?
                }
              }
        elsif current_developer
          render :json =>
          Skill
            .all()
            .map {
            |skill| {
              :id => skill.id,
              :grade => skill.grade,
              :title => skill.title,
              :domain_id => skill.domain_id
            }
          }
        end

      end

    end

  end

end

