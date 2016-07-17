class RenameVacationTableintoTreasuremaps < ActiveRecord::Migration
  def change
    rename_table :vacations, :treasuremaps
  end
end
