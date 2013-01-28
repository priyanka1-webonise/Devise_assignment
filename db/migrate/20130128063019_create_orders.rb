class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :set_order
      t.integer :order_total

      t.timestamps
    end
  end
end
