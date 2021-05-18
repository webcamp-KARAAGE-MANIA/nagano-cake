class ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_paramas)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      redirect_back(fallback_location: shipping_addresses_path)
    else
      render :index
    end
  end

  def edit
  end

  private
  def shipping_address_paramas
    params.require(:shipping_address).permit(:attention, :postal_code, :address)
  end
end
