class Admin::ProductsController < ApplicationController
  before_filter :authenticate_admin!

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    # Handle a successful save.
    if @product.save
      flash[:success] = "Created!"
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def index
    logger.info("%%%%%%%%%%%%%%%#{current_admin.inspect}")
    if current_admin.present?
      @products=Product.all
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  def edit
    @product=Product.find(params[:id])
  end

  def update
    @product=Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success]="updated successfully"
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

end

