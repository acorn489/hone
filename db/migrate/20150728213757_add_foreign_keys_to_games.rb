class AddForeignKeysToGames < ActiveRecord::Migration
  def change
  	add_column :games, :primary_skill_id, :integer
  	add_index :games, :primary_skill_id
  	add_column :games, :secondary_skill_id, :integer
  	add_index :games, :secondary_skill_id
  end
end
