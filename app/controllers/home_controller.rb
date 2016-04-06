class HomeController < ApplicationController
  before_action :authenticate_user

  def show
    @courses = Course.all
  end
end
