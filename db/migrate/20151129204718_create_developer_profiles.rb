class CreateDeveloperProfiles < ActiveRecord::Migration
  def change
    create_table :developer_profiles do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
