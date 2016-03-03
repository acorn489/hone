class AccessController < ApplicationController
	def show
		redirect_to(:controller => 'access', :action => "login")
	end

	def logout
		session[:user_id] = nil
		session[:username] = nil
		flash[:notice] = "Logged out. See you soon!"
		redirect_to(:controller => 'access', :action => "login")
	end

	def login
		if session[:user_id]
			if(session[:return_to])
				redirect_to session.delete(:return_to)
			else
				redirect_to(:controller => home_controller, :action => 'show')
			end
		end
	end

	def attempt_login
		if params[:username].present? && params[:password].present?
			found_user = User.where(:username => params[:username]).first
			if found_user
				authorized_user = found_user.authenticate(params[:password])
			end
		end
		if authorized_user
			session[:user_id] = authorized_user.id
			session[:username] = authorized_user.username
			user_message = {
				Admin: "You are now logged in. Have fun administrating Hone!",
				Student: "You are now logged in. Have fun learning new things with Hone everyday!",
				Developer: "You are now logged in. Have fun developing for Hone!"
			}
			flash[:notice] = user_message[current_user.class.name.split('::').last.to_sym]
			if(session[:return_to])
				redirect_to session.delete(:return_to)
			else
				redirect_to(:controller => home_controller, :action => 'show')
			end
		else
			flash[:error] = "Invalid username or password"
			redirect_to(:action => 'login')
		end
	end

end
