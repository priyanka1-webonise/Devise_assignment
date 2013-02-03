class CreateBillingInformations < ActiveRecord::Migration
  def change
    create_table :billing_informations do |t|
      t.string :email
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :country
      t.integer :contact_no
      t.date :delivery_date
      t.string :card_type
      t.integer :card_number
      t.string :card_code

      t.timestamps
    end
  end
end
