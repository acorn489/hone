class RemoveSecondarySkillIdFromGames < ActiveRecord::Migration
  def self.up
    remove_column :games, :secondary_skill_id
  end

  def self.down
    add_column :games, :secondary_skill_id, :integer
  end
end
