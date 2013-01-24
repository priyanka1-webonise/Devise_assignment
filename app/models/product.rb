class Product < ActiveRecord::Base
  attr_accessible :name, :price, :publish_date
end
