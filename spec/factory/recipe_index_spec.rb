require 'rails_helper'

RSpec.describe 'Recipe Index Page', type: :feature do
  before do
    create_list(:recipe, 5)
    visit recipes_path
  end

  it 'displays a list of recipes' do
    expect(page).to have_content('Recipes')
    Recipe.all.each do |recipe|
      expect(page).to have_link(recipe.name, href: recipe_path(recipe))
      expect(page).to have_content(recipe.description)
    end
  end

  it 'allows removing recipes' do
    first_recipe = Recipe.first
    within "#recipe-#{first_recipe.id}" do
      click_on 'REMOVE'
    end
    expect(page).to have_content("Recipe removed successfully.")
    expect(page).not_to have_content(first_recipe.name)
  end

  it 'allows adding a new recipe' do
    click_on 'Add Recipe'
    expect(page).to have_content('New Recipe')
  end
end
