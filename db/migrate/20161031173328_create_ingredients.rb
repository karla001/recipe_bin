class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :portion
      t.string :p_unit_of_measure
      t.string :brand

      t.timestamps null: false
    end
  end
end
