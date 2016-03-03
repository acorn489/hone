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
		session[:return_to] = request.fullpath if request.get? && request.fullpath != "/home"
	end

	def verify_session
		raise NoSession unless session[:user_id]
	end

	def authorize_role(role)
		verify_session
		current_user.authorize_role(role)
	end

	def home_controller
		if current_user.is_a? Admin
			return 'admin'
		end
		if current_user
			return 'home'
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
