class RemovePrimarySkillIdFromGames < ActiveRecord::Migration
  def self.up
    remove_column :games, :primary_skill_id
  end
  def self.down
    add_column :games, :primary_skill_id, :integer
  end
end
