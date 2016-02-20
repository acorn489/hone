class AdminController < ApplicationController
	before_action except: [:login, :attempt_login, :logout] do
		authorize_role(Admin)
	end
end
