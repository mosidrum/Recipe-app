class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true
  validates :public, inclusion: { in: [true, false] }

  def preparation_time_hours
    hours = preparation_time / 60
    hours.to_i
  end

  def preparation_time_minutes
    minutes = preparation_time % 60
    minutes.to_i
  end

  def cooking_time_hours
    hours = cooking_time / 60
    hours.to_i
  end

  def cooking_time_minutes
    minutes = cooking_time % 60
    minutes.to_i
  end

  def total_time_hours
    total = preparation_time + cooking_time
    hours = total / 60
    hours.to_i
  end

  def total_time_minutes
    total = preparation_time + cooking_time
    minutes = total % 60
    minutes.to_i
  end
end
