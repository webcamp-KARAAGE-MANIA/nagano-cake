class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  attachment :image

  validates :name, presence: true, uniqueness: true, length: {maximum: 20}
  validates :introduction, presence: true, length: {minimum: 3, maximum: 100}
  validates :price, presence: true, numericality: { only_integer: true }
  validates :image, presence: true


  def add_tax_price
    (self.price * 1.10).round
  end
end
