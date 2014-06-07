Spree::CheckoutController.class_eval do
 # Updates the order and advances to the next state (when possible.)
 # def update
 #   if @order.update_from_params(params, permitted_checkout_attributes)
 #     persist_user_address
 #     unless @order.next
 #       flash[:error] = @order.errors.full_messages.join("\n")
 #       redirect_to checkout_state_path(@order.state) and return
 #     end

 #     if @order.completed?
 #        # Add booking to the database when order is complete
 #        @order.line_items.each do |item|
 #          item.variant.product.booking.build( booking_date: item.booking_date,  )

 #      session[:order_id] = nil
 #       flash.notice = Spree.t(:order_processed_successfully)
 #       flash[:commerce_tracking] = "nothing special"
 #       redirect_to completion_route
 #     else
 #       redirect_to checkout_state_path(@order.state)
 #     end
 #   else
 #     render :edit
 #   end
 # end

end
