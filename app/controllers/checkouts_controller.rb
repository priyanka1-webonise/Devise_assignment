class CheckoutsController < ApplicationController
  def index
    @order = Order.where(:user_id=>current_user.id).first
    @line_items = @order.line_items
    @billing_information = BillingInformation.new
    logger.info"#################### new #{@billing_information.inspect}"
  end

  def create
      @billing_information = BillingInformation.new(params[:billing_information])
      @billing_information.save
    redirect_to checkouts_path
  end

end
