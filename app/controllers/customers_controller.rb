class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])

  end

  def confirm
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       redirect_to edit_customer_path
    else
       render 'edit'
    end
  end

  def hide
    @customer = Customer.find(params[:id])
    @customer.update(is_delete: true)
    end

  private

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :surname, :surname_kana, :postal_code, :address, :phone_number, :email)
  end

end
