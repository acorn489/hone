class EditGames < ActiveRecord::Migration
  def change
  	remove_column :games, :status
  end
end
