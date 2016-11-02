class RecipesController < ApplicationController
  before_action :authorize
  def new
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.new
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = "You have created a recipe!"
      redirect_to new_user_recipe_ingredient_path(params[:user_id], @recipe.id)
    else
      render 'new'
    end
  end


  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes
  end

  def show

    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    @ingredients = @recipe.ingredients

  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to user_recipe_path(current_user, @recipe.id)
       flash[:notice] = "You have edited a recipe!"
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_recipes_path(current_user)
  end

  private
    def recipe_params
      params.require(:recipe).permit(
        :name,
        :instruction,
        :feeds,
        :price,
        :image,
        )
    end
end

