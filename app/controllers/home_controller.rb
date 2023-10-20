class HomeController < ApplicationController
  def index
    @foods = Food.all.order(id: :desc)
  end
end
