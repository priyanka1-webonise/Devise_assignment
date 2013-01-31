class OrdersController < ApplicationController

  def update
    logger.info "########################################### update #{params.inspect}"
    @order=Order.find(params[:id]) rescue nil
    if @order.present?
      new_item_quantity = (params[:order][:line_items][:product_quantity])
      new_item_product_id = (params[:order][:line_items][:product_id])
      line_item = @order.line_items.where(:product_id => new_item_product_id).first
      if line_item.present?
        logger.info("%%%%%%%%%%%Inside line_item#{line_item.inspect}")
        quantity = (line_item.product_quantity) + (new_item_quantity.to_i)
        line_item.update_attributes(:product_quantity => quantity)
        line_item.sub_total = line_item.calculate_subtotal
        line_item.save
      else
        line_item =  @order.line_items.build(params[:order][:line_items])
        line_item.sub_total = line_item.calculate_subtotal
        line_item.save
      end
      logger.info("%%%%%%%%%%%%%%%%#{@order.inspect}")
      @order.update_attributes(:order_total => @order.calculate_order_total)
    end
    respond_to do |format|
      format.js
    end
  end

end
