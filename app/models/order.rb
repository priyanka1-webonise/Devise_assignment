class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  attr_accessible :order_total, :set_order, :user_id
end
