class LineItemsController < ApplicationController
  def new
    @line_item = LineItem.new
  end

  def create
    logger.info "########################################### create line item #{params.inspect} product_id #{params[:product_id]}"
     @product = Product.find(params[:product_id])
     order = Order.where(:set_order=>false)

     @order = Order.create(:user_id=>current_user.id)
     @line_item = LineItem.new(:product_quantity => params[:line_item][:product_quantity],:product_id => params[:product_id],:order_id => params[:order_id],:order_id=>@order.id)
     @line_item.sub_total = @line_item.calculate_subtotal
    # Handle a successful save.
    if @line_item.save
     # flash[:success] = "Created!"

      logger.info "###########################################  line item #{@item.inspect}"
      redirect_to products_path
    else
      render 'new'
    end
  end


end
