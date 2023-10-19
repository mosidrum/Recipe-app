class HomeController < ApplicationController
  def index
    @all_food = Food.all.order(id: :desc)
  end
end
