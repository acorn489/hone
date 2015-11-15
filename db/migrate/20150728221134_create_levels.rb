class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :value
      t.belongs_to :student, index: true
      t.belongs_to :course, index: true

      t.timestamps null: false
    end
  end
end
