class RemoveLevelFromSkills < ActiveRecord::Migration
  def self.up
    remove_column :skills, :level
  end
  def self.down
    add_column :skills, :level, :integer
  end
end
