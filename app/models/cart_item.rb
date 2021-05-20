class CartItem < ApplicationRecord
belongs_to :customer
belongs_to :product

validates :customer_id, :product_id, :quantity, presence: true

 def subtotal_price
		product.add_tax_price.to_i * quantity.to_i
 end

end
