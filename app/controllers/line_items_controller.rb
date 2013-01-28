class LineItemsController < ApplicationController
  def new
    @line_item = LineItem.new
  end

  def create
    logger.info "########################################### create line item #{params.inspect} product_id #{params[:product_id]}"

    #@price = @product.price
    #@item=@product.line_item
   # @line_item = LineItem.new(params[:line_item])
    @line_item = LineItem.new(:product_quantity => params[:line_item][:product_quantity],:product_id => params[:product_id])
    @line_item.sub_total = @line_item.calculate_subtotal
    # Handle a successful save.

    if @line_item.save
     # flash[:success] = "Created!"
      #@product = @item.product
      #@price = @product.price
      #@item = LineItem.find(params[:product_id])
      #@price = @item.price
      logger.info "########################################### create line item #{@item.inspect}"
      redirect_to products_path
    else
      render 'new'
    end
  end
end
