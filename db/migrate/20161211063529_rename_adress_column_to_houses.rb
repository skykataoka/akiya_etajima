class RenameAdressColumnToHouses < ActiveRecord::Migration
  def change
    rename_column :houses, :adress, :address
  end
end
