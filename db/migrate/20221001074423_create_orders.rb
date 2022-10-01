class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_name
      t.string :shipping_postal_code
      t.string :shipping_address
      t.integer :payment_method
      t.integer :full_amount
      t.integer :postage, default: "800"
      t.integer :order_status

      t.timestamps
    end
  end
end
