class AdminController < ApplicationController
	before_action except: [:login, :attempt_login, :logout] do
		authorizeRole(Admin)
	end
end
