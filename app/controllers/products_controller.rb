class ProductsController < ApplicationController

  def index
    # if gerel idが送られてきていたら
    #   @products = genre_id.products
    #   @genres = Genre.all
    # else
      @products = Product.page(params[:page]).per(8)
      @genres = Genre.all
    # end
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def product_params
    params.require(:product).permit(:name, :introduction, :genre_id, :price, :image, :is_active)
  end

end
