class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def current_user
		return unless session[:user_id]
		@current_user ||= User.find(session[:user_id])
	end

	def store_location
		session[:return_to] = request.fullpath if request.get? && request.fullpath != "/students/home"
	end

	def roles_valid(rolable)
		if rolable.kind_of?(Array)
			rolable.any?{|clazz| current_user.is_a?(clazz)}
		else
			current_user.is_a?rolable
		end
	end

	def authenticate(rolable)
		if current_user && roles_valid(rolable)
			return true
		end
		if current_user && !roles_valid(rolable)
			flash[:error] = "You don't have permission to access the requested page."
		else
			flash[:notice] = "Please login to access this page."
			store_location
		end
		redirect_to(:controller => 'access', :action => 'login')
	end

	def home_controller
		return current_user.is_a?(Developer) ? 'developers' : 'students'
	end

	helper_method :home_controller

end
