class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id)
    else
      render :new
    end
  end

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :genre_id, :price, :image, :is_active )
  end
end
