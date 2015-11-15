class EditIndexPass < ActiveRecord::Migration
  def change

  	add_index :passes, [:student_id, :skill_id], unique: true
  end
end
