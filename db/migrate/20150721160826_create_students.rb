class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.date :dob
      t.integer :age
      t.integer :score

      t.timestamps null: false
    end
  end
end
