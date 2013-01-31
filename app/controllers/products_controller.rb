class ProductsController < ApplicationController
  def index
    if current_user.present?
      @products=Product.all
      @order = Order.where(:set_order => false).first
      unless @order.present?
        @order = Order.create(:user_id=>current_user.id)
      end
    end
  end

  def show
    @product=Product.find(params[:product_id])
  end
end
