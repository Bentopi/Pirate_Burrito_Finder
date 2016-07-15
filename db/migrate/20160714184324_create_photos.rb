class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :vacation, index: true, foreign_key: true
      t.string :location
      t.string :latitude
      t.string :longitude
      t.string :photo_id

      t.timestamps null: false
    end
  end
end
