class ChangeExpensesStatusToHouses < ActiveRecord::Migration
  def up
    change_column :houses, :expenses_status, 'integer USING CAST(expenses_status AS integer)'
  end
  
  def down
    change_column :houses, :expenses_status, :boolean
  end
end
