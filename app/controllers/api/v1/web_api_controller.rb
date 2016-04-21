module Api
  module V1
    class WebApiController < BaseController
      before_action :authenticate_user!

      def collect_skill
        unless params[:id].present?
          return render nothing: true, status: :bad_request
        end
        student_skill = CompletedStudentSkill.find_by(skill_id: params[:id])
        student_skill.collected = true
        student_skill.save
        render nothing: true, status: :ok
      end

      def skills
        unless params[:course_id].present?
          return render nothing: true, status: :bad_request
        end

        if current_student
          render :json =>
            Skill
              .joins(
                'LEFT JOIN completed_student_skills ON completed_student_skills.skill_id = skills.id AND completed_student_skills.student_id = ' +
                  ActiveRecord::Base.sanitize(session['warden.user.user.key'][0][0])
              )
              .select(
                'completed_student_skills.*',
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
                  :completed => !skill.collected.nil?,
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

