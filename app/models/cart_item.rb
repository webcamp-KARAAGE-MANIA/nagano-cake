class CartItem < ApplicationRecord
belongs_to :customer
belongs_to :product

validates :customer_id, :product_id, :quantity, presence: true

validates :quantity, inclusion: { in: [1,2,3,4,5,6,7,8,9,10] }
validates :quantity, numericality: { only_integer: true }


 def subtotal_price
		product.add_tax_price.to_i * quantity.to_i
 end

end
