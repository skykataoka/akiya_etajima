class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :house_id
      t.integer :content

      t.timestamps null: false
    end
  end
end
