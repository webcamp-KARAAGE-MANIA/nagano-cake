class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def favorite_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
