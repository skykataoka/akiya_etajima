class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :avator, :string
    add_column :users, :birthday, :date
    add_column :users, :address, :string
    add_column :users, :introduction, :text
    add_column :users, :want_to_do, :text
    add_column :users, :hobby, :string
    add_column :users, :skill, :string
    add_column :users, :occupation, :string
    add_column :users, :sex, :string
    add_column :users, :spouse, :string
    add_column :users, :child, :integer
    add_column :users, :number_of_occupants, :integer
    add_column :users, :budget_for_rent, :integer
    add_column :users, :budget_for_buy, :integer
    add_column :users, :status, :integer, default: 0
  end
end
