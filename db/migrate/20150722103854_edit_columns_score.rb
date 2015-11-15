class EditColumnsScore < ActiveRecord::Migration
  def change
  	remove_column :scores, :best_score
  	add_column :scores, :best_score, :boolean, :default => false
  end
end
