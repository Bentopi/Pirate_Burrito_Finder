class RemoveColumnsFromPhotos < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.remove :photo_id
    end
  end
end
