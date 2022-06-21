class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :item
	
	enum production_status: { cannotbemanufactured: 0, waitingforproduction: 1, production: 2, productioncompleted: 3 }
	
	def subtotal 
		amount * item.add_tax_price
	end
	
	def add_tax_price
		(self.price * 1.1).round
	end
end
