class CreateUserLanguage < ActiveRecord::Migration
  def change
    create_table :user_languages do |t|
      t.integer :user_id, :null => false, :references => [:users, :id]
      t.string :language
      t.timestamps null: false
    end
  end
end
