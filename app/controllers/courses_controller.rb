class CoursesController < ApplicationController

	def show
		verify_session

		if current_user.is_a?(Developer)
			@course = Course.friendly.find(params[:slug])
			@domains = @course.domains
			render 'courses/developers_show'

		elsif current_user.is_a?(Student)
			@course = Course.friendly.find(params[:slug])
			level = Level.where(:course_id => @course.id, :student_id => session[:user_id]).count
			if level == 0
				@course.enroll(session[:user_id])
			end
			@domains = @course.domains
			@available_games_counts = Array.new
			@domains.each do |domain|
				@available_games_counts.push(domain.unlocked_games(session[:user_id]).count)
			end
			render 'courses/students_show'
		end
	end

end
