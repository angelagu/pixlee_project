class AddDatePostedToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :posted_date, :datetime
  end
end
