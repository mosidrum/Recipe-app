class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true

  def total_price
    food.price * quantity
  end

  def quantity_needed
    [quantity - food.quantity, 0].max
  end

  def total_price_need
    food.price * quantity_needed
  end
end
