class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @order = order
    mail(to: @order.email, subject: @order.id)
  end

end
