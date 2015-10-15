module CookiesHelper
  # Logs in the given user.
  def log_in(account)
    cookies[:account] = account.id
  end
  # Returns the current logged-in user (if any).
  def current_account
    @current_account ||= Account.find_by(id: cookies[:account])
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_account.nil?
  end
end
