class CartItem < ApplicationRecord
  has_many :customers, dependent: :destroy
  has_many :products, dependent: :destroy
end
