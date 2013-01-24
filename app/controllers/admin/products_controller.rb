class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:user])
    # Handle a successful save.
    if @product.save
      flash[:success] = "Created!"
      redirect_to
    else
      render 'new'
    end
  end

  def index
    logger.info("%%%%%%%%%%%%%%%#{current_admin.inspect}")
    if current_admin.present?
      #@admin=Admin.find(current_admin.id)
      @products=Product.all
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @destroy.destroy
    redirect_to _path
  end
end

