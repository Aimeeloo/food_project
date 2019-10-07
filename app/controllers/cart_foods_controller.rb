class CartFoodsController < ApplicationController
  before_action :find_cart_food, only: [:update]

  def create
    if user_signed_in?
      @cart_food = current_cart.cart_foods.find_by(food_id: params[:format])
      if @cart_food != nil
        @cart_food.update(cart_food_params)
      else
        @cart_food = CartFood.new(cart_food_params)
        @cart_food.cart = current_cart
        @cart_food.food = Food.find_by(id: params[:format])
        @cart_food.giver_id = Food.find_by(id: params[:format]).user_id
      end
      if @cart_food.save
        redirect_to foods_path, notice: '已加入購物車！！'
      else
        redirect_to foods_path, notice: '加入失敗'
      end
    else
      redirect_to user_session_path, notice: '請先登入會員！'  
    end
  end
  
  private
  def find_cart_food
    @cart_food = CartFood.find_by(cart_id: current_cart.id)
  end

  def cart_food_params
    params.require(:cart_food).permit(:quantity, :giver)
  end
end