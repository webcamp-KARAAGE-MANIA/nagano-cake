class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum order_status: { 入金待ち: 0, 入金確認: 1, 制作中: 2, 発送準備中: 3, 発送済み: 4}
  enum payment_method: { クレジットカード: 0, 銀行振り込み: 1}
  # モデル内で定義されたenumは、モデルを通じてデータベースのカラムとつながっている
  # モデルオブジェクトにenum定義することによって、該当するカラムの値の参照や設定などを行えるメソッドが追加される
  def order_product_total
    total_amount - shipping_fee.round
  end

end
