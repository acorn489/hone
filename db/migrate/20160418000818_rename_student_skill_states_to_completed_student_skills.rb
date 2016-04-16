class RenameStudentSkillStatesToCompletedStudentSkills < ActiveRecord::Migration
  def change
    rename_table :student_skill_states, :completed_student_skills
  end
end
