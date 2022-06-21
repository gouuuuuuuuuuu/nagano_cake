class Admin::OrderDetailsController < ApplicationController
	
def update
	 @order_detail = OrderDetail.find(params[:id])
	 @order=@order_detail.order
   @order_detail.update(order_detail_params)
   if @order_detail.production_status == "production"
      @order.update(order_status:"production")
   end 
   if @order_detail.production_status == "productioncompleted"
      @order.order_details.each do |order|
      @order.update(order_status:"readytoship")
   end
   end
   redirect_to  admin_order_path(@order)
end
	
private

def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :production_status)
end
end
