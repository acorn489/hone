class CreatePasses < ActiveRecord::Migration
  def change
    create_table :passes do |t|
      t.belongs_to :student, index: true
      t.belongs_to :skill, index: true
      t.timestamps null: false
    end
  end
end
