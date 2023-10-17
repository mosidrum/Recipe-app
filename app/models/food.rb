class Food < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :measurement_unit, presence: true
end