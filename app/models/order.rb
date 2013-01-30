class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  attr_accessible :order_total, :set_order, :user_id

  def calculate_subtotal
    price = self.product.price
    quantity = self.product_quantity
    price * quantity
  end

  def calculate_order_total
    line_items = self.lineitems
    line_items.each do |n|



       n.subtotal


    end

  end

end
