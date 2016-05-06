class OrdersController < ApplicationController

  def create
    if params[:food_id]
      current_account.orders.create(:date => Date.today, :food_id => params[:food_id], :remark => params[:remark], :priceAdj => params[:priceAdj])
    end
    redirect_to action: "new", rest_id: params[:rest_id]
  end

  def new
    if logged_in?
      @account = current_account
      @orders = @account.orders.where('date = ?', Date.today)
      @orderedFood = @account.foods.where('date = ?', Date.today)
      @restaurant = Restaurant.all

      if params[:rest_id] != ''
        @foods = Food.where('restaurant_id = ? and active = 1',params[:rest_id])
        @foodTypes = FoodType.where('restaurant_id = ?',params[:rest_id])
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    Order.delete(params[:id])
    redirect_to action: "new"
  end

  def show
  end

  def index
    @account = current_account
    @orders = Order.where('date = ? and account_id = ?', Date.today, @account.id)
    @foods = Food.all

    respond_to do |format|
      format.html
      format.csv {send_data @orders.to_csv}
      format.xls {send_data @orders.to_csv(col_sep: "\t") }
    end
  end
end
