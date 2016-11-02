class IngredientsController < ApplicationController
  before_action :authorize
  def show
    @ingredient = Ingredient.find(current_user.id, @recipe.id, :id)
    @recipe = @ingredient.recipe
    @ingredients = @recipe.ingredients.where(id: @ingredient.id)
    @user = @ingredient.recipe.user
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients

  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new(ingredient_params)
    if @ingredient.save
      flash[:notice] = "You have added an ingredient!"
      redirect_to user_recipe_ingredients_path(params[:user_id], @recipe.id)
    else
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to user_recipe_path(params[:user_id], @recipe.id)
  end

   def edit
     @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if@ingredient.update_attributes(ingredient_params)
      redirect_to user_recipe_ingredient_path(current_user, @recipe.id)
       flash[:notice] = "You have edited your ingredient!"
    else
      render 'edit'
    end
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name,:portion, :p_unit_of_measure, :brand )
    end
end
