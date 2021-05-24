class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items ,dependent: :destroy
  has_many :shipping_addresses ,dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_products, through: :favorites, source: :product

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :surname,
            :name,
            :surname_kana,
            :name_kana,
            :postal_code,
            :address,
            :phone_number,
            :email,
            :encrypted_password,
            presence: true

  def full_name
    self.surname + " " + self.name
  end

  def full_name_kana
    self.surname_kana + " " + self.name_kana
  end

  def active_for_authentication?
    super && (self.is_delete == false)
  end

  def self.customer_search(search)
    if search
      Customer.where('surname LIKE ?', '%' + search + '%')
    end
  end
end