class RenameClustersToDomains < ActiveRecord::Migration
  def change
  	rename_table :clusters, :domains
  end
end
