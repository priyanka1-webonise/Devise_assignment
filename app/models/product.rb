class Product < ActiveRecord::Base
  belongs_to :user
  mount_uploader :product_image, ProductImageUploader
  attr_accessible :name, :price, :publish_date, :product_image
  validates :name, :presence => true
  validates :price, :presence => true, :numericality => true
  validates :publish_date, :presence => true
end
