class RemoveSkillIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :skill_id
  end
end
