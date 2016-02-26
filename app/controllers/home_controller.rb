class HomeController < ApplicationController
	before_action except: [:login, :attempt_login, :logout] do
    verify_session
	end

	def show
		@courses = Course.all
	end
end
