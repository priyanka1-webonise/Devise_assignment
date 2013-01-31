class ProductsController < ApplicationController
  def index
    logger.info "########################################### product index #{params.inspect}"
    if current_user.present?
      @products=Product.all
      @order = Order.where(:set_order => false).first
      unless @order.present?
        @order = Order.create(:user_id=>current_user.id)
      end
    end
  end


end
