class EditColumnsScore2 < ActiveRecord::Migration
  def change
  	rename_column :scores, :best_score, :best_personal_score
  	add_column :scores, :best_global_score, :boolean, :default => false
  	add_column :scores, :value, :float
  end
end
