class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_item
  attr_accessible :order_total, :set_order
end
