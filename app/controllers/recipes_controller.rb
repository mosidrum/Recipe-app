class RecipesController < ApplicationController
  before_action :set_user

  def index
    @recipes = @user.recipes.includes(:user) if user_signed_in?
  end

  def destroy
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Successfully Removed Recipe.'
  end

  def create
    @recipes = user.recipes.build(recipes_Params)
    if @recipes.save
      redirect_to recipes_path
    else
      reder :new
    end
  end

  def new
    @recipe = @user.recipes.build
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  private

  def set_user
    @user = current_user
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public, :description)
  end
end
