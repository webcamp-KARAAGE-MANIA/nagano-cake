class Admin::CustomersController < ApplicationController

  def index

  end

  def show

  end

  def edit

  end

  def updated

  end

  def hide

  end

 private
  def customer_params
    params.require(:customer).permit(:surname,
                                     :name,
                                     :surname_kana,
                                     :name_kana,
                                     :postal_code,
                                     :address,
                                     :phone_number,
                                     :email,
                                     :encrypted_password,
                                     :is_delete)
  end

end
