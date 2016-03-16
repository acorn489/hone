class CreateStudentSkillStates < ActiveRecord::Migration
  def change
    create_table :student_skill_states do |t|
      t.integer :student_id
      t.integer :skill_id
      t.integer :state

      t.timestamps null: false
    end
  end
end
