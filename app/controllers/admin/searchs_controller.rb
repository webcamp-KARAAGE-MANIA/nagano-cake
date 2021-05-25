class Admin::SearchsController < ApplicationController

  def search
    @search = params[:search]
    @customers = Customer.customer_search(params[:search]).page(params[:page]).per(9)
    @products = Product.product_search(params[:search]).page(params[:page]).per(9)
  end

end