class ProductsController < ApplicationController

  def index
    if current_user.present?
      @products=Product.all
      #@product = Product.find(params[:id])
      #@line_item = @product.line_item
    end
  end

end
