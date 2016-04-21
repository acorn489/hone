class SkillsController < ApplicationController
  before_action :authenticate_student!
  def show
    @course = Course.find_by_slug(params[:course])
  end
end
