class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def index
    @order=Order.all
  end

  def show
  @order=Order.find(params[:id])
  end
  
  def create
   order=Order.new(order_params)
   order.customer_id = current_customer.id
   order.save
   cart_items= current_customer.cart_items
   cart_items.each do |cart_item|
    @order_detail=OrderDetail.new
    @order_detail.order_id=order.id
    @order_detail.item_id=cart_item.item_id
    @order_detail.price=cart_item.item.price
    @order_detail.amount=cart_item.amount
    @order_detail.save
   end
   redirect_to completion_public_orders_path
  end
  
  
  def confirmation
    @order=Order.new(order_params)
    if params[:order][:select_address] == '0'
      @order.postal_code=current_customer.postal_code
      @order.address=current_customer.address
      @order.name=current_customer.name
    elsif params[:order][:select_address] == '1'
    address=Address.find(params[:order][:address_id])  
    @order.postal_code=address.postal_code
    @order.address=address.address
    @order.name=address.name
    elsif params[:order][:select_address] == '2'
    end
  end
  
  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postage, :total_payment, :order_status, :postal_code, :address, :name)
  end
end
