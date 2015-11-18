class RenameColumnInSkills < ActiveRecord::Migration
  def change
  	rename_column :skills, :cluster_id, :domain_id
  end
end
