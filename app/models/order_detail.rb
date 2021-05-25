class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  enum product_status: { 着手不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3 }

  def order_detail_product_total
    product.add_tax_price * quantity.round
  end

  # order_statusの変更
  def change_order_status
    if self.product_status == "製作中"
      self.order.update(order_status: :制作中)
    elsif OrderDetail.where(order_id: self.order_id).pluck(:product_status).all?{ |product_status| product_status == "制作完了" }
      self.order.update(order_status: :発送準備中)
    end
  end
end