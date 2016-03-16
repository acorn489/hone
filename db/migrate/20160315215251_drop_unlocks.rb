class DropUnlocks < ActiveRecord::Migration
  def up
    drop_table :unlocks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
