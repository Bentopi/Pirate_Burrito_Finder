class AddphotoIDtophotostable < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.string :photo_id
    end
  end
end
