class SkillsController < ApplicationController
  def show
    @course = Course.find_by_slug(params[:course])
  end
end
