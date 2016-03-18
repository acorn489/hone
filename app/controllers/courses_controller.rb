class CoursesController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_developer
      @course = Course.friendly.find(params[:slug])
      @domains = @course.domains
      render 'courses/developers_show'

    elsif current_student
      @course = Course.friendly.find(params[:slug])
      @domains = @course.domains
      @games_counts = Array.new
      @domains.each do |domain|
        @games_counts.push(domain.games(current_student).count)
      end
      render 'courses/students_show'
    end
  end

end
