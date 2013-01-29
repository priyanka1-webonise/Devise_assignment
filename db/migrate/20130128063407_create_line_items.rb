class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :product_quantity
      t.integer :sub_total
      t.timestamps
    end
  end
end
