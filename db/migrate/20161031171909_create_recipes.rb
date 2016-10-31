class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instruction
      t.integer :feeds
      t.string :image
      t.float :price
      t.boolean :public_view

      t.timestamps null: false
    end
  end
end
