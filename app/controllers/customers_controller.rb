class CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def confirm
  end

  def update
  end

  def hide
  end
end
