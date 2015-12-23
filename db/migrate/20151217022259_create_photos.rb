class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :collection_id
      t.string :media_url
      t.string :link
      t.string :tags
      t.string :type

      t.timestamps null: false
    end
  end
end
