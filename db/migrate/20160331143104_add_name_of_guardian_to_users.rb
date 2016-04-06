class AddNameOfGuardianToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name_guardian, :string
  end
end
