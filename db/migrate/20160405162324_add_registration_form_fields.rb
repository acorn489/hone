class AddRegistrationFormFields < ActiveRecord::Migration
  def change
    add_column :users, :birthdate, :date
    add_column :users, :best_language, :string
    add_column :users, :languages, :string
    add_column :users, :study_language, :string
    add_column :users, :email_guardian, :string
  end
end
