class Admin::OrdersController < ApplicationController

  # before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page])
  end

  def current_index
    @orders = Order.where(customer_id:params[:id])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = customer_id.id
    if @order.save
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "注文ステータスを更新しました！"
      redirect_to admin_order_path(@order)
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end