class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :profile_id
      t.string :username
      t.string :password_digest
      t.string :type

      t.timestamps null: false
    end

    add_index :users, :profile_id
  end
end
