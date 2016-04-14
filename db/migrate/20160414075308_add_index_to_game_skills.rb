class AddIndexToGameSkills < ActiveRecord::Migration
  def change
    add_index :game_skills, [:game_id, :skill_id], :unique => true
  end
end
