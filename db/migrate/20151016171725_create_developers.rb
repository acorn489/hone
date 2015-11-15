class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.date :dob
      t.integer :age

      t.timestamps null: false
    end
  end
end
