class HomeController < ApplicationController

	def welcome
		if session[:user_id]
			if session[:user_type] == "student"
				redirect_to(:controller => 'students', :action => 'home')
			elsif session[:user_type] == "developer"
				redirect_to(:controller => 'developers', :action => 'home')
			end
		end
	end
end
