class CookiesController < ApplicationController
  def new

  end
  def login

    account = Account.find_by(login: params[:cookies][:login].downcase)
    if account
      if account.active == true
        log_in(account)
        if account.user_gp == 0
          redirect_to page_admin_path
        elsif account.user_gp == 1
          redirect_to page_login_path
        end
      else
        @err_msg="This account is inactive, please contact admin to activate."
        render 'new'
      end
    else
        @err_msg="User '" + params[:cookies][:login] + "' is not found."
        render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def guestLogin
    guest = Account.create(:first_name => params[:firstname], :last_name =>  params[:lastname], :location => params[:floor], :user_gp => 2)
    log_in(guest)
    redirect_to new_order_path
  end
end
