Spree::CheckoutController.class_eval do
 # def update
 #   if @order.update_from_params(params, permitted_checkout_attributes)
 #     persist_user_address
 #     unless @order.next
 #       flash[:error] = @order.errors.full_messages.join("\n")
 #       redirect_to checkout_state_path(@order.state) and return
 #     end

 #     if @order.completed?
 #      # Add booking to the database when order is complete
 #      @order.line_items.each do |item|
 #        booking = BusBooking.where(booking_date: item.booking_date, bus_id: item.bus.id ).first  

 #        if booking
 #          s = booking.seats_left - item.adults - item.children
 #          if s >= 0
 #            booking.seats_left = s 
 #          else
 #            # Error
 #            flash[:error] = Spree.t(:not_enough_seats_left_now)
 #            # @order.errors.add(:base, "Not enough seats left, gotta be quick!")
 #            redirect_to checkout_state_path("payment") and return
 #          end

 #        else
 #          # booking = Booking.new( booking_date: item.booking_date, bus_id: item.bus.id, product: item.variant.product, seats_left: item.bus.seats )
 #          booking = BusBooking.new( booking_date: item.booking_date, bus_id: item.bus.id, product_id: item.variant.product.id, seats_left: item.bus.seats )
 #        end
 #        booking.save
 #      end

 #       session[:order_id] = nil
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
