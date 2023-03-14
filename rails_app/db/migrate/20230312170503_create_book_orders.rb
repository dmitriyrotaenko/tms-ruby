class CreateBookOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :book_orders do |t|
      t.integer :book_id
      t.integer :order_id

      t.timestamps
    end
  end
end
