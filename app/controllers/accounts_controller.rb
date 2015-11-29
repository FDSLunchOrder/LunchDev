class AccountsController < ApplicationController

  before_action :find_account, :only => [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all

    respond_to do |format|
      format.html
      format.csv {send_data @accounts.to_csv}
      format.xls {send_data @accounts.to_csv(col_sep: "\t") }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @account }
    end
  end

  def new
    @account = Account.new

    respond_to do |format|
      format.html #new.html.erb template
      format.xml { render :xml => @account }
    end
  end

  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        flash[:notice] = 'Account successfully created'
        format.html { redirect_to(@account) }
        format.xml {render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml {render :xml => @account.errors, :status => :unprocessable_entity}
      end
    end
  end

  def edit

  end

  def update

    respond_to do |format|
      if @account.update_attributes(account_params)
        flash[:notice] = 'Account was successfully updated'
        format.html { redirect_to(@account) }
        format.xml {head :ok}
      else
        format.html { render :action => 'edit' }
        format.xml { render :xml => @account.errors, :status => :unprocessable_entity}
      end
    end
   end

  def destroy

    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml { head :ok }
    end

  end

  def import
    Account.import(params[:file])
    redirect_to accounts_url, notice: "Accounts imported."
  end

  private

  def account_params
    params.require(:account).permit(:first_name, :last_name, :location, :login, :user_gp, :active)
  end

  def find_account
    @account = Account.find(params[:id])
  end

  def accessible_attributes
    ["first_name", "last_name", "location", "login", "user_gp","active"]
  end

  end


