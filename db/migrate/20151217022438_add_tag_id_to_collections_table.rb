class AddTagIdToCollectionsTable < ActiveRecord::Migration
  def change
  	add_column :collections, :tag_id, :integer
  end
end
