class CreateUnlocks < ActiveRecord::Migration
  def change
    create_table :unlocks do |t|
      t.belongs_to :student, index: true
      t.belongs_to :game, index: true

      t.timestamps null: false
    end
  end
end
