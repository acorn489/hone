class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :image
      t.string :android_link
      t.string :ios_link
      t.string :web_link
      t.belongs_to :skill, index: true

      t.timestamps null: false
    end
  end
end
