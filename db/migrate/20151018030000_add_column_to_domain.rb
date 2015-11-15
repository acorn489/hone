class AddColumnToDomain < ActiveRecord::Migration
  def change
  	add_column :domains, :screening_title, :string
  end
end
