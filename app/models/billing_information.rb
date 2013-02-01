class BillingInformation < ActiveRecord::Base
  belongs_to :order
  attr_accessible :address_one, :address_two, :card_code, :card_number, :card_type, :city, :contact_no, :country, :delivery_date, :email, :order_id
end
