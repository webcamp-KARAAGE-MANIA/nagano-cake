class ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = current_customer.shipping_addresses
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_paramas)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      redirect_back(fallback_location: shipping_addresses_path)
    else
      @shipping_addresses = current_customer.shipping_addresses
      render :index
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_paramas)
      redirect_to shipping_addresses_path
    else
      @shipping_addresses = current_customer.shipping_addresses
      render :edit
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_back(fallback_location: shipping_addresses_path)
  end

  private
  def shipping_address_paramas
    params.require(:shipping_address).permit(:attention, :postal_code, :address)
  end
end
