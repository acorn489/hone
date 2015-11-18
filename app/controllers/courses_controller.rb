class CoursesController < ApplicationController

	def developers_show
		@course = Course.find_by_id(params[:id])
		@domains = @course.domains
	end

	def students_show
		@course = Course.find_by_id(params[:id])
		level = Level.where(:course_id => params[:id], :student_id => session[:user_id]).count
		if level == 0
			@course.enroll(session[:user_id])
		end
		@domains = @course.domains
		@available_games_counts = Array.new
		@domains.each do |domain|
			@available_games_counts.push(domain.unlocked_games(session[:user_id]).count)
		end
	end	
end
