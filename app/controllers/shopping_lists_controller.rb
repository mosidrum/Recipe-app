class ShoppingListsController < ApplicationController
  def index
    recipe_id = params[:recipe_id]
    return unless recipe_id.present?

    @recipe = Recipe.find_by(id: recipe_id)
    return redirect_to root_path, alert: 'Recipe was not found' unless @recipe

    @foods = current_user.foods
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @items_to_buy = 0
    @needed_money = 0

    @recipe_foods.each do |recipe_food|
      food = recipe_food.food
      if recipe_food.quantity < food.quantity
        @items_to_buy += food.quantity - recipe_food.quantity
        @needed_money += food.price * @items_to_buy
      end
    end
  end

  def generate
    recipe_id = params[:recipe_id]
    return redirect_to root_path, alert: 'Recipe not found' unless Recipe.exists?(recipe_id)

    redirect_to shopping_lists_path(recipe_id:)
  end
end
