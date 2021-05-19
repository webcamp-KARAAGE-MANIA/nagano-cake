class CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:success] = "登録情報を無事変更しました😊"
       redirect_to customer_path
    else
       render :edit and return
    end
  end

  def hide
    @customer = current_customer
    @customer.update(is_delete: true)
    # byebug
    reset_session
    flash[:notice] = "ありがとうございました！またのご利用を心よりお待ちしております😊"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :surname, :surname_kana, :postal_code, :address, :phone_number, :email, :is_delete)
  end

end
