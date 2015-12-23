class RemoveCollectionIdFromPhotos < ActiveRecord::Migration
  def change
  	remove_column :photos, :collection_id
  	remove_column :photos, :tags
  end
end
