class DevelopersController < ApplicationController
	before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]


	def login
		if session[:user_id]
			flash[:notice] = "You are already logged in"
			redirect_to(:controller => 'developers', :action => 'home')
			return false
		end
	end

	def home
		@courses = Course.all
	end

	def attempt_login
		if params[:username].present? && params[:password].present?
			found_user = Developer.where(:username => params[:username]).first
			if found_user
				authorized_user = found_user.authenticate(params[:password])
			end
		end
		if authorized_user
			session[:user_id] = authorized_user.id
			session[:username] = authorized_user.username
			session[:user_type] = "developer"
			flash[:notice] = "You are now logged in";
			redirect_to(:controller => 'developers', :action => 'home')
		else
			flash[:notice] = "Invalid username or password"
			redirect_to(:action => 'login')
		end
	end

	def logout
			session[:user_id] = nil
			session[:username] = nil
			session[:user_type] = nil
			flash[:notice] = "Logged Out"
			redirect_to(:controller => 'home', :action => "welcome")
	end

end
