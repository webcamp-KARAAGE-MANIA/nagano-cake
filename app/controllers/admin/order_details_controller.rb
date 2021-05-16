class Admin::OrderDetailsController < ApplicationController

  def create

    @order_detail = OrderDetail.find(params[:order_detail])
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      # 商品のステータスはenumを使用する
    end
  end

end
