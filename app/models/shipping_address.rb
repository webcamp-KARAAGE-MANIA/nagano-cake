class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :attention, presence: true
  validates :postal_code, presence: true,numericality: {only_integer: true}, length: { in: 7..7 }
  validates :address, presence: true
end
