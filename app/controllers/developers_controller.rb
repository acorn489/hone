class DevelopersController < ApplicationController
	before_action except: [:login, :attempt_login, :logout] do
		authorizeRole(Developer)
	end

	def home
		@courses = Course.all
	end

end
