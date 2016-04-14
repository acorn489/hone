class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  %w(Student Developer Admin).each do |k|
    define_method "current_#{k.underscore}" do
      current_user if current_user.is_a?(k.constantize)
    end

    define_method "authenticate_#{k.underscore}!" do |_opts = {}|
      send("current_#{k.underscore}") || not_authorized
    end
  end

  def home_controller
    if current_admin
      return 'admin'
    elsif current_developer
      return 'developer'
    elsif current_user
      return 'home'
    end
    'welcome'
  end

  helper_method :home_controller

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || '/'
  end

  def not_authorized
    flash[:error] = "You don't have permission to access the requested page."
    redirect_to(controller: 'welcome', action: 'show')
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :name, :name_guardian, :email, :email_guardian, :birthdate, :best_language, :languages, :study_language, :password, :password_confirmation, :platform, :gender, :country, :type, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :name, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :best_language, :languages, :study_language, :password, :password_confirmation, :platform, :type, :current_password) }
  end

  def current_resource_owner
    puts doorkeeper_token.resource_owner_id
    Game.find_by_id(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
