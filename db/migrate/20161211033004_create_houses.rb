class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.integer :comment_id
      t.integer :favorite_id
      t.string :adress
      t.float :longitude
      t.string :tel
      t.string :email
      t.boolean :release_status
      t.boolean :expenses_status

      t.timestamps null: false
    end
  end
end
