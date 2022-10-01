class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :included_price
      t.integer :amount
      t.integer :crafting_status, default: "1"

      t.timestamps
    end
  end
end
