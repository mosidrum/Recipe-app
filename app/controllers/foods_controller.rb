class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = Food.all
  end

  # def show; end

  def new
    @food = Food.new
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to foods_path, notice: 'Food successfully deleted.'
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      redirect_to foods_path, notice: 'Ingredient was created.'
    else
      redirect_to new_food_path, alert: 'Cannot create a new ingredient. Try again!'
    end
  end

  private

  def foods_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
