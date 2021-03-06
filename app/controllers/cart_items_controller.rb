class CartItemsController < ApplicationController

    before_action :authenticate_customer!

    def index
        @cart_items = current_customer.cart_items
        @total_price = @cart_items.sum{|c| c.product.add_tax_price * c.quantity }
    end

    def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id #誰のカートか紐付け
        @cart_items = current_customer.cart_items.all
        @cart_items.each do |cart_item|
     if cart_item.product_id == @cart_item.product_id
       new_quantity = cart_item.quantity + @cart_item.quantity
       cart_item.update_attribute(:quantity, new_quantity)
       @cart_item.delete
     end
    end
       if @cart_item.save
          redirect_to cart_items_path, notice: 'カートに商品が追加されました'
       else
        @product = Product.find_by(id: @cart_item.product_id)
        redirect_to product_path(params[:cart_item][:product_id]), notice: '数量を選択してください'
       end
    end

    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path, notice: '商品数量変更完了しました'
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to cart_items_path, notice: '削除しました'
    end

    def destroy_all
        @cart_items = current_customer.cart_items
        @cart_items.destroy_all
        redirect_to cart_items_path, notice: 'カート内商品全て削除しました'
    end

	private

    def cart_item_params
    params.require(:cart_item).permit(:quantity,:product_id)
    end

end
