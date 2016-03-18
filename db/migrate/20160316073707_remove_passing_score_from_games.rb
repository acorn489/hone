class RemovePassingScoreFromGames < ActiveRecord::Migration
  def self.up
    remove_column :games, :passing_score
  end

  def self.down
    add_column :games, :passing_score, :integer
  end
end
