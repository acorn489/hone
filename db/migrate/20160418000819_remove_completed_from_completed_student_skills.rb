class RemoveCompletedFromCompletedStudentSkills < ActiveRecord::Migration
  def change
    remove_column :completed_student_skills, :completed
  end
end
