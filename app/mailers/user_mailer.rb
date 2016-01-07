class UserMailer < ApplicationMailer
    default from: 'Alert@lucnhOrder.sys'

  def alert_email(account, orderDate)
    # @email=account.login+'@factset.com'
    @email=account.login+'@test.com'
    delivery_options = { address: 'mail.factset.com' }
    mail(to: @email, cc: 'yourself@factset.com', subject: 'Lunch Order Alert for ' + orderDate.strftime("%m/%d/%Y (%a)"), delivery_method_options: delivery_options)
  end
end
