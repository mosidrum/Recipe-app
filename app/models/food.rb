class Food < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :measurement_unit, presence: true

  def name_and_measurement_unit
    "#{name} (#{measurement_unit})"
  end
end
