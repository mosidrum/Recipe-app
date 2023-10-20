class HomeController < ApplicationController
  def index
    @foods = Food.includes(:category).all.order(id: :desc)
  end
end
