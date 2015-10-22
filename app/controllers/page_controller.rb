class PageController < ApplicationController
  def admin
    if logged_in?
      @account = current_account
    else
      redirect_to root_url
    end
  end
  def login
    if logged_in?
      @account = current_account
    else
      redirect_to root_url
    end
  end
  def guest
  end
end
