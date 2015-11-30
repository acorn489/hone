class AdminController < ApplicationController
	before_action except: [:login, :attempt_login, :logout] do
		authenticate(Admin)
	end
end
