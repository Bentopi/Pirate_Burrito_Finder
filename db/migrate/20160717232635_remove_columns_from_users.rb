class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :latitude, :longitude, :location
    end
  end
end
