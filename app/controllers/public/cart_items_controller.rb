class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items= current_customer.cart_items
  end
  
  def update
    @cart_items = CartItem.find(params[:cart_item][:item_id])
    @cart_items.update(amount: params[:cart_item][:amount])
    redirect_to public_cart_items_path
  end
  
  def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.customer_id = current_customer.id
    @cart_items.save!
    redirect_to public_cart_items_path
  end
  
  def destroy
    @cart_item= CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end
  
  def destroy_all
    @cart_item= current_customer.cart_items
    @cart_item.destroy_all
    redirect_to public_cart_items_path
  end
  
  private

def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
end
end
