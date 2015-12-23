class CreateCollectionsPhotosJoinTable < ActiveRecord::Migration
  def self.up
  	create_table :collections_photos, :id => false do |t|
  		t.references :collection, :null => false
  		t.references :photo, :null => false
  	end
  	add_index(:collections_photos, [:collection_id, :photo_id], :unique => true)
  	add_index(:collections_photos, :collection_id)
  end

  def self.down
  	drop_table :collections_photos
  	remove_index(:collections_photos, name: 'index_collections_photos_on_collection_id')
  	remove_index(:collections_photos, name: 'index_collections_photos_on_collection_id_and_photo_id')
  end
end