class RemoveStateFromStudentSkillStates < ActiveRecord::Migration
  def change
    remove_column :student_skill_states, :state
  end
end
