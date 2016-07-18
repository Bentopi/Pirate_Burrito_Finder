class AddDescriptionColumnToPhotosTable < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.string :description
    end
  end
end
