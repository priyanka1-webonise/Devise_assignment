class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_one :billing_information
  attr_accessible :order_total, :set_order, :user_id

  def calculate_order_total
    line_item = self.line_items
    order_total = 0
    line_item.each do |line_item|
      order_total += line_item.sub_total
    end
    return order_total
  end

end
