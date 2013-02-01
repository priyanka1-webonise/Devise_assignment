class BillingInformationsController < ApplicationController
  @billing_information = BillingInformation.new(params[:billing_information])
  @billing_information.save
  redirect_to carts_path
end
