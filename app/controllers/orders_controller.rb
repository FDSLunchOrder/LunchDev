class OrdersController < ApplicationController

  def create
    if params[:food_id]
      current_account.orders.create(:date => Date.today, :food_id => params[:food_id], :remark => params[:remark], :priceAdj => params[:priceAdj])
    end
    redirect_to action: "new"
  end

  def new
    if logged_in?
      @account = current_account
      @orders = @account.orders.where('date = ?', Date.today)
      @orderedFood = @account.foods.where('date = ?', Date.today)
      @foods = Food.all
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
    @orders = Order.where('date = ?', Date.today)
    @foods = Food.all

    respond_to do |format|
      format.html
      format.csv {send_data @orders.to_csv}
      format.xls {send_data @orders.to_csv(col_sep: "\t") }
    end
  end
end
