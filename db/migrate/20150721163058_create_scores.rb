class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :correct_answers
      t.integer :incorrect_answers
      t.boolean :best_score
      t.belongs_to :student, index: true
      t.belongs_to :game, index: true

      t.timestamps null: false
    end
  end
end
