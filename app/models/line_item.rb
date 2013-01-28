class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :product_quantity, :sub_total, :product_id, :order_id

  def calculate_subtotal
    price = self.product.price
    quantity = self.product_quantity
    price * quantity
  end

end
