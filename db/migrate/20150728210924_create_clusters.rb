class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|
      t.string :title
      t.string :description
      t.belongs_to :course, index: true

      t.timestamps null: false
    end
  end
end
