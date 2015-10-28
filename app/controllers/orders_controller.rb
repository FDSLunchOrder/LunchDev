class OrdersController < ApplicationController

  def create
  end

  def new
    #if logged_in?
      @account = current_account
    #else
    #  redirect_to root_url
    #end
  end

  def destroy
  end

  def show
  end
end
