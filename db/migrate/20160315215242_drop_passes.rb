class DropPasses < ActiveRecord::Migration
  def up
    drop_table :passes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
