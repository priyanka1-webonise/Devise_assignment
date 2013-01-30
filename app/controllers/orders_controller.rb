class OrdersController < ApplicationController



  def update


    logger.info "########################################### update #{params.inspect}"
    @order=Order.find(params[:id])


    #@order_line_items = @order.line_items.build(params[:order][:line_items])
    #@order_line_items.sub_total = @order_line_items.calculate_subtotal
    #@last_line_item = LineItem.last.product_id
    @line_items = LineItem.all

      @line_items.each do |line_item|
        if line_item.product_id == LineItem.last.product_id
          line_item.product_quantity = LineItem.last.product_quantity + line_item.product_quantity
        else
          @order_line_items = @order.line_items.build(params[:order][:line_items])
          @order_line_items.sub_total = @order_line_items.calculate_subtotal
        end

      end


    logger.info "########################################### update #{@last_line_item.inspect}"
    @order_line_items.save
    flash[:success] = "Added to cart!"


    respond_to do |format|
      format.js
    end
  end



end
