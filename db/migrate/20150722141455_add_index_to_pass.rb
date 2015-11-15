class AddIndexToPass < ActiveRecord::Migration
  def change
  	add_index :passes, [:student_id, :skill_id]
  end
end
