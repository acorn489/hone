class EditColumnsScore3 < ActiveRecord::Migration
  def change
  	rename_column :scores, :value, :value_out_ten
  end
end
