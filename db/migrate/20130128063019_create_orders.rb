class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :set_order, :default => false
      t.integer :order_total, :default => 0

      t.timestamps
    end
  end
end
