class RemoveTagIdAddDatesToCollections < ActiveRecord::Migration
  def change
    remove_column :collections, :tag_id
    add_column :collections, :start_date, :datetime
    add_column :collections, :end_date, :datetime
  end
end
