class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new

  end

  def create

  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def confirm

  end

  def complete

  end
end
