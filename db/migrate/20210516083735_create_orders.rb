class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment_method, default: 0
      t.integer :total_amount
      t.string :shipping_address
      t.string :postal_code
      t.string :attention
      t.integer :shipping_fee
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
