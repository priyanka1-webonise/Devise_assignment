class LineItemsController < ApplicationController

  def index
    logger.info "########################################### index #{params.inspect}"
    @order = Order.where(:set_order => false).first
    logger.info "########################################### index #{@order.inspect}"
    @line_items = @order.line_items
    logger.info "########################################### index #{@line_items.inspect}"
    #@line_item = LineItem.find(params[:id])
    @products = @line_items.produc

    logger.info "########################################### index #{@products.inspect}"
   # @product = @products.find(params[:order][:line_items][])

  end
end
