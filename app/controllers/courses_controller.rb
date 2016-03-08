class CoursesController < ApplicationController
  before_action :authenticate_user!

	def show
		if current_developer
			@course = Course.friendly.find(params[:slug])
			@domains = @course.domains
			render 'courses/developers_show'

		elsif current_student
			@course = Course.friendly.find(params[:slug])
			level = Level.where(:course_id => @course.id, :student_id => current_user.id).count
			if level == 0
				@course.enroll(current_user)
			end
			@domains = @course.domains
			@available_games_counts = Array.new
			@domains.each do |domain|
				@available_games_counts.push(domain.unlocked_games(current_student).count)
			end
			render 'courses/students_show'
		end
	end

end
