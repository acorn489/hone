class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
      t.string :email
      t.date :dob

      t.timestamps null: false
    end
  end
end
