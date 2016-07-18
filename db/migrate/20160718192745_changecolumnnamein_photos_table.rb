class ChangecolumnnameinPhotosTable < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.rename :photo_id, :attachment_id
    end
  end
end
