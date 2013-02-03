class CartsController < ApplicationController
   def index
     @order = Order.where(:user_id=>current_user.id).first
     @line_items = @order.line_items
   end

   def destroy
     line_item = LineItem.find(params[:id])
     line_item.destroy
     redirect_to carts_path
   end

end
