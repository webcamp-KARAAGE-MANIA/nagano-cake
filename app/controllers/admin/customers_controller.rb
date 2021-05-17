class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if
      customer.update(customer_params)
      redirect_to admin_customers_path
    else
      render 'edit'
    end
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
