class OrdersController < ApplicationController
  def update
    logger.info "########################################### update #{params.inspect}"
    @new_item_quantity = (params[:order][:line_items][:product_quantity])
    logger.info "########################################### new_quantity #{@new_item_quantity.inspect}"
    @new_item_product_id = (params[:order][:line_items][:product_id])
    logger.info "########################################### new_item_id #{ @new_item_product_id.inspect}"
    @order=Order.find(params[:id]) rescue nil
    @line_items_all=@order.line_items
    logger.info "########################################### items #{ @line_items_all.inspect}"
    @line_items_all.each do |line_item|
      if line_item.product_id ==  @new_item_product_id
         line_item.product_quantity =  @new_item_quantity +  line_item.product_quantity
         logger.info "########################################### add #{ line_item.product_quantity.inspect}"
      else
        @order_line_items = @order.line_items.build(params[:order][:line_items])
        @order_line_items.sub_total = @order_line_items.calculate_subtotal
      end
    end
    ##@order_line_items = @order.line_items.build(params[:order][:line_items])
    #@order_line_items.sub_total = @order_line_items.calculate_subtotal
    #@order_line_items.save
    respond_to do |format|
      format.js
    end
  end
end
