class AddColumnsToSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :level, :integer
  	add_column :skills, :locked_skill_id, :integer
  	add_index :skills, :locked_skill_id
  end
end
