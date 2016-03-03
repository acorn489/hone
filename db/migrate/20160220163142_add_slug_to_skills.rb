class AddSlugToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :slug, :string
    add_index :skills, :slug
  end
end
