class WelcomeController < ApplicationController
  def show
    if current_user
      if current_admin
        return redirect_to(:controller => 'admin', :action => 'show')
      elsif current_developer
        return redirect_to(:controller => 'developer', :action => 'show')
      end
      redirect_to(:controller => home_controller, :action => 'show')
    end
  end
end
