class LineItemsController < ApplicationController
  def new
    @line_item =LineItem.new
  end

  def create
    @product = Product.find(params[:id])
    @item=@product.line_item
    @line_item = LineItem.new(params[:line_item])
    # Handle a successful save.
    if @line_item.save
     # flash[:success] = "Created!"
      redirect_to products_path
    else
      render 'new'
    end
  end
end
