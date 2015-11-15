class EditGamesColumns < ActiveRecord::Migration
  def change
  	remove_column :games, :passing_score
  	add_column :games, :passing_score, :float
  end
end
