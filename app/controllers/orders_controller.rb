class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    #@order = Order.create(:user_id=>current_user.id)
  end

  def update
    logger.info "########################################### update #{params.inspect}"
    @order=Order.find(params[:id])

    @order_line_items = @order.line_items.build(params[:order][:line_items])
    @order_line_items.sub_total = @order_line_items.calculate_subtotal
    @order_line_items.save

    #if @order.update_attributes(params[:order])
      redirect_to  products_path
   # else
    #  redirect_to products_path
    #end
 end

end
