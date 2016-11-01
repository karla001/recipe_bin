class RemovePublicViewFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :public_view, :boolean
  end
end
