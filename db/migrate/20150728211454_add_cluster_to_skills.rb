class AddClusterToSkills < ActiveRecord::Migration
  def change
    add_reference :skills, :cluster, index: true, foreign_key: true
  end
end
