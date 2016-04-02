class AddCollectedToStudentSkillStates < ActiveRecord::Migration
  def change
    add_column :student_skill_states, :collected, :boolean
  end
end
