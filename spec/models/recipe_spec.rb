require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is invalid when name is not present' do
    recipe = Recipe.new(description: 'A test recipe')
    expect(recipe).to_not be_valid
  end

  it 'is invalid when description is not present' do
    recipe = Recipe.new(name: 'Example Recipe')
    expect(recipe).to_not be_valid
  end
end
