class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end

  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show

  end

  def edit

  end

  def update

  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :genre_id, :price, :image, :is_active)
  end
end
