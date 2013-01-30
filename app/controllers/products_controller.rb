class ProductsController < ApplicationController

  def index
    #respond_to do |format|
     # format.js
    #end
    if current_user.present?
      @products=Product.all
      #@order = Order.new
      @order = Order.where(:set_order => false).first
      unless @order.present?
        @order = Order.create(:user_id=>current_user.id)
      end
      logger.info "########################################### order #{@order.inspect}"

    end
  end

  def show
    @product=Product.find(params[:product_id])


  end
end
