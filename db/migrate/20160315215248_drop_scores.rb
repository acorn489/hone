class DropScores < ActiveRecord::Migration
  def up
    drop_table :scores
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
