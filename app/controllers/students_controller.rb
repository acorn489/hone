class StudentsController < ApplicationController

	before_action except: [:login, :attempt_login, :logout] do
		authenticate(Student)
	end

	def home
		@courses = Course.all
	end

end
