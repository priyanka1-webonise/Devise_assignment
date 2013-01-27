class ProductsController < ApplicationController

  def index
    if current_user.present?
      @products=Product.all
    end
  end

end
