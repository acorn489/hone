class AddCourseToSkills < ActiveRecord::Migration
  def change
    add_reference :skills, :course, index: true, foreign_key: true
  end
end
