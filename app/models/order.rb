class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  validates :total_amount, presence: true
  validates :shipping_address, presence: true
  validates :postal_code, presence: true,numericality: {only_integer: true}, length: { in: 7..7 }
  validates :attention, presence: true

  enum order_status: { 入金待ち: 0, 入金確認: 1, 制作中: 2, 発送準備中: 3, 発送済み: 4}
  enum payment_method: { クレジットカード: 0, 銀行振込: 1}
  # モデル内で定義されたenumは、モデルを通じてデータベースのカラムとつながっている
  # モデルオブジェクトにenum定義することによって、該当するカラムの値の参照や設定などを行えるメソッドが追加される
  def order_product_total
    total_amount - shipping_fee.round
  end

  # product_status変更
  def change_order_details_status
    if self.order_status == "入金待ち"
      self.order_details.update(product_status: :着手不可)
    elsif self.order_status == "入金確認"
      self.order_details.update(product_status: :制作待ち)
    end
  end


  def full_address
    self.postal_code + " " + self.address + " " + self.attention
  end

  def subtotal_price
		product.add_tax_price.to_i * quantity.to_i
  end

end
