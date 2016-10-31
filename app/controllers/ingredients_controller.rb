class IngredientsController < ApplicationController

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipe = @ingredient.recipe
    @ingredients = @recipe.ingredients.where(subject_name: @ingredient.subject_name)
    @user = @ingredient.recipe.user
  end

  def new

  end

  def create
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name,:portion, :p_unit_of_measure, :brand )
    end
end
