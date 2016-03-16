class CreateGameSkills < ActiveRecord::Migration
  def change
    create_table :game_skills do |t|
      t.integer :skill_id, :null => false, :references => [:skills, :id]
      t.integer :game_id, :null => false, :references => [:games, :id]
      t.timestamps null: false
    end
  end
end
