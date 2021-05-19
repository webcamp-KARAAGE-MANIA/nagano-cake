class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
  end

  def confirm
    if params[:order][:address_option] == 0
      @order.shipping_address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.attention = current_customer.surname + current_customer.name
    end
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    render :new if @order.invalid?
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_details = @order.order_details.new
        @order_details.product_id = cart_item.product_id
        @order_details.quantity = cart_item.quantity
        @order_details.save
        @order.shipping_fee = 800
        @order.total_amount = cart_item.subtotal_price
        @order.total_amount += @order.shipping_fee
        current_customer.cart_items.destroy_all
      end
  end

  def create
    @order = Order.new(order_params)
    @oeder.shipping_fee = 800
     @order.save
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def complete

  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :total_amount, :shipping_address, :postal_code, :attention, :shipping_fee)
  end
end
