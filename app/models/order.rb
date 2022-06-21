class Order < ApplicationRecord
	   belongs_to :customer
	   has_many :order_details
	   enum payment_method: { credit_card: 0, transfer: 1 }
	   enum order_status: { waitingfordeposit: 0, confirmation: 1, production: 2, readytoship: 3, shipped: 4}
	  
	   
def add_tax_price
        (self.price * 1.1).round
end
end