class AddCompletedToStudentSkillStates < ActiveRecord::Migration
  def change
    add_column :student_skill_states, :completed, :boolean
  end
end
