class OrdersController < ApplicationController
  def index
    @orders = current_customer.orders.page(params[:page]).per(10)
  end

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
  end

  def confirm
    @order = Order.new(order_params)

    @order.customer_id = current_customer.id
    # render :new if @order.invalid?
    if params[:order][:address_option] == "0"
      @order.shipping_address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.attention = current_customer.surname + current_customer.name
    elsif params[:order][:address_option] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.shipping_address = @shipping_address.address
      @order.postal_code = @shipping_address.postal_code
      @order.attention = @shipping_address.attention
    end
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.sum{|c| c.product.add_tax_price * c.quantity }
    @order.shipping_fee = 800
    @order.total_amount = @order.shipping_fee + @total_price

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_fee = 800
    if @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_details = @order.order_details.new
      @order_details.product_id = cart_item.product_id
      @order_details.quantity = cart_item.quantity
      @order_details.save
      current_customer.cart_items.destroy_all
    end
    @order.shipping_fee = 800
    @total_price = @cart_items.sum{|c| c.product.add_tax_price * c.quantity }
    @order.total_amount = @order.shipping_fee + @total_price
    redirect_to complete_orders_path, notice: '注文を承りました！'
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def complete

  end

  # def subtotal_price
  #   product.add_tax_price.to_i * quantity.to_i
  # end

  private
  def order_params
    params.require(:order).permit(:payment_method, :total_amount, :shipping_address, :postal_code, :attention, :shipping_fee)
  end

end
