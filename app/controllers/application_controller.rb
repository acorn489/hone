class ApplicationController < ActionController::Base
	class NoSession < StandardError
	end
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	%w(Student Developer Admin).each do |k|
		define_method "current_#{k.underscore}" do
			current_user if current_user.is_a?(k.constantize)
		end

		define_method "authenticate_#{k.underscore}!" do
			|opts={}| send("current_#{k.underscore}") || not_authorized
		end
	end

	def home_controller
		if current_admin
			return 'admin'
                elsif current_user
			return 'home'
		end
		return 'welcome'
	end

	helper_method :home_controller

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		stored_location_for(resource) || '/home'
	end

	def not_authorized
		flash[:error] = "You don't have permission to access the requested page."
		redirect_to(:controller => 'welcome', :action => 'show')
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :name
		 devise_parameter_sanitizer.for(:account_update) << :name
	end
end
