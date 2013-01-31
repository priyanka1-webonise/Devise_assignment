class CartsController < ApplicationController
   def index
     logger.info "########################################### index #{params.inspect}"
     @order = Order.where(:user_id=>current_user.id).first
   end

   def destroy
     logger.info "########################################### destroy #{params.inspect}"
     @line_item = LineItem.find([:id])
   end

end
