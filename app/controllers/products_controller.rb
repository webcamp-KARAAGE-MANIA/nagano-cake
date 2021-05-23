class ProductsController < ApplicationController

  def index
    # if product_id == @genre.product_id
    #   @products = genre.product.all
    #   @genres = Genre.all
    # end
    @products = Product.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

   def bookmarks
     @favorite_products = current_customer.favorite_products.order(created_at: :desc).page(params[:page]).per(10)
   end

  def product_params
    params.require(:product).permit(:name, :introduction, :genre_id, :price, :image, :is_active)
  end

end
