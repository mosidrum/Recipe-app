class ShoppingListsController < ApplicationController
  def index
    @recipes = current_user.recipes.includes(recipe_foods: :food)
    @global_items_to_buy = 0
    @global_needed_money = 0.0
    @missing_foods = []

    @recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        food = recipe_food.food
        next unless recipe_food.quantity > food.quantity

        items_to_buy = recipe_food.quantity - food.quantity
        @global_items_to_buy += 1
        @global_needed_money += food.price * items_to_buy


        @missing_foods << { name: food.name, quantity: items_to_buy, value: food.price * items_to_buy }
      end
    end
  end

  def generate
    redirect_to shopping_lists_path
  end
end
