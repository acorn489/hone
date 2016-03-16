class RemoveLockedSkillIdFromSkill < ActiveRecord::Migration
  def self.up
    remove_column :skills, :locked_skill_id
  end
  def self.down
    add_column :skills, :locked_skill_id, :integer
  end
end
