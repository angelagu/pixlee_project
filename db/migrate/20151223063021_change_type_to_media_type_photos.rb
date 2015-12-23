class ChangeTypeToMediaTypePhotos < ActiveRecord::Migration
  def change
  	rename_column :photos, :type, :media_type
  end
end
