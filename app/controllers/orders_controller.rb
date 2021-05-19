class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_customer.Order.new(order_params)
    @oeder.shipping_fee = 800
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_details = @order.order_details.new
        @order_details.product_id = cart_item.product_id
        @order_details.quantity = cart_item.quantity
        @order_details.save
        @order.total_amount = cart_item.price * cart_item.quantity + @order.shipping_fee
  　　  　current_user.cart_items.destroy_all
     end
     @order.save
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def confirm
    
  end

  def complete

  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :total_amount, :shipping_address, :postal_code, :attention, :shipping_fee)
  end
end
