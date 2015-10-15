class CookiesController < ApplicationController
  def new

  end
  def login

    account = Account.find_by(login: params[:session][:login].downcase)
    if account
      log_in(account)
      if account.user_gp == 0
        redirect_to page_admin_path
      elsif account.user_gp == 1
        redirect_to page_login_path
      end
    else
        render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
