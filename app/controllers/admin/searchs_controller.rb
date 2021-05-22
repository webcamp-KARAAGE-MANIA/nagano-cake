class Admin::SearchsController < ApplicationController
  def search
    @range = params[:range]
    search = params[:search]
    @word = params[:word]

    if @range == 'customer'
       @customer = Customer.search(search,@word)
    else
       @product = Product.search(search,@word)
    end
  end

end