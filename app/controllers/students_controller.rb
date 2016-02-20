class StudentsController < ApplicationController

	before_action except: [:login, :attempt_login, :logout] do
		authorize_role(Student)
	end

	def home
		@courses = Course.all
	end

end
