class RemoveCourseIdFromSkill < ActiveRecord::Migration
  def self.up
    remove_column :skills, :course_id
  end
  def self.down
    add_column :skills, :course_id, :integer
  end
end
