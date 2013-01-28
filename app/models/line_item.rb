class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :product_quantity, :sub_total
end
