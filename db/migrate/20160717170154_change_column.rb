class ChangeColumn < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.rename :vacation_id, :treasuremap_id
    end

  end
end
