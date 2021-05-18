class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items ,dependent: :destroy

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


end
