class AccountController < ApplicationController

  #List all Account
  def index
    @account = Account.all
  end

  #Create new user account
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.save

    #Redirect back to index page
    redirect_to :action => :index
  end

  #Display Account attributes
  def show
    @account = Account.find(params[:id])
  end

  #Edit Account
  def edit
    @account = Account.find(params[:id])
  end

  #Update Account
  def update
    @account = Account.find(params[:id])
    @account.update(account_params)

    #Redirect back to index
    redirect_to :action => :index
  end

  #Delete Account
  def delete
    @account = Account.find(params[:id])
    @account.destroy

    #Redirect back to index
    redirect_to :action => :index
  end

private

  def account_params
    params.require(:account).permit(:first_name, :last_name, :location, :login, :user_gp)
  end
end
