class CartItem < ApplicationRecord
belongs_to :customer
belongs_to :product

validates :customer_id, :product_id, :quantity, presence: true
#validates :quantity, numericality: { only_integer: true } #数値のみか検証

end
