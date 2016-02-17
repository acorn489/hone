class ApplicationController < ActionController::Base
	class NoSession < StandardError
	end
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

	def authorizeRole(role)
		raise NoSession unless session[:user_id]
		current_user.authorizeRole(role)
	end

	def home_controller
		if current_user
			lowercase_name = current_user.class.name.downcase;
			return lowercase_name + (lowercase_name != "admin" ? 's' : '')
		end
		return 'access'
	end

	helper_method :home_controller

	rescue_from User::NotAuthorized, with: :user_not_authorized
	rescue_from NoSession, with: :no_session

	private
	def user_not_authorized
		flash[:error] = "You don't have permission to access the requested page."
		redirect_to(:controller => 'access', :action => 'login')
	end

	private
	def no_session
		flash[:notice] = "Please login to access this page."
		store_location
		redirect_to(:controller => 'access', :action => 'login')
	end

end
