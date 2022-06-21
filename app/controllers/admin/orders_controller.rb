class Admin::OrdersController < ApplicationController
  def index
     @orders=Order.page(params[:page]).per(3)
  end
  
  def show
     @order=Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "confirmation"
      @order.order_details.each do |order_detail|
        order_detail.update(production_status:"waitingforproduction")
    end  
    end
    redirect_to  admin_order_path(@order[:id])
  end
  
  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :postage, :total_payment, :order_status, :postal_code, :address, :name)
  end
end
