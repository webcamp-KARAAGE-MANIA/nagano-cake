class OrderMailer < ApplicationMailer

  def order_email(customer)
    @customer = customer
   mail(:subject => "nagano_cake 注文完了のお知らせ", to: customer.email)
  end
end
