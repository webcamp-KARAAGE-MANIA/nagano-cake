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

  def self.search(search, word)
    if search == 'perfect'
      Customer.where(name: word)
    elsif search == 'forward'
      Customer.where('name LIKE ?', word + '%')
    elsif search == 'backward'
      Customer.where('name LIKE ?', '%' + word)
    else
      Customer.where('name LIKE ?', '%' + word + '%')
    end
  end

end