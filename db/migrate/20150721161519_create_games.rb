class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.integer :platform
      t.integer :status
      t.string :link
      t.integer :passing_score
      t.belongs_to :skill, index: true

      t.timestamps null: false
    end
  end
end
