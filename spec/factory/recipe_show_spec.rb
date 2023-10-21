require 'rails_helper'

RSpec.describe 'Recipe Show Page', type: :feature do
  let(:recipe) { create(:recipe) }

  before do
    visit recipe_path(recipe)
  end

  it 'displays recipe details' do
    expect(page).to have_content(recipe.name)
    expect(page).to have_content("by #{recipe.user.name}")
    expect(page).to have_content(recipe.description)
  end

  it 'allows toggling the "Public" status for the recipe', js: true do
    expect(page).to have_selector('label.switch')
    within 'label.switch' do
      find('input[type="checkbox"]').click
      expect(recipe.reload.public).to be_falsey
    end
  end

  it 'displays a list of ingredients' do
    recipe.recipe_foods.each do |recipe_food|
      expect(page).to have_content(recipe_food.food.name)
      expect(page).to have_content(recipe_food.quantity)
      expect(page).to have_content(recipe_food.total_price)
    end
  end

  it 'allows deleting ingredients', js: true do
    first_recipe_food = recipe.recipe_foods.first
    within "#recipe-food-#{first_recipe_food.id}" do
      find('button', text: 'Delete').click
    end
    expect(page).to have_content("Ingredient removed successfully.")
    expect(page).not_to have_content(first_recipe_food.food.name)
  end

  it 'provides links to add ingredients and generate a shopping list' do
    expect(page).to have_link('Add ingredient', href: new_recipe_recipe_food_path(recipe))
    expect(page).to have_link('Generate shopping List', href: generate_shopping_lists_path(recipe_id: recipe.id))
  end
end
