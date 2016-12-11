class AddColumnToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :title, :string
    add_column :houses, :description, :string
    add_column :houses, :scale, :string
    add_column :houses, :construction, :string
    add_column :houses, :structure, :string
    add_column :houses, :toilet, :string
    add_column :houses, :price, :integer
    add_column :houses, :note, :string
    add_column :houses, :latitude, :float
  end
end
