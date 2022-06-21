class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :customer_id
      t.integer :payment_method
      t.integer :postage
      t.integer :total_payment
      t.integer :order_status ,default: 0

      t.timestamps
    end
  end
end
