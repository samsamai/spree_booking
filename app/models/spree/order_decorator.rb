Spree::Order.class_eval do

  remove_checkout_step :delivery
  # remove_checkout_step :address

  def valid_geolocation?
    return true
  end

  def notify_shops_new_order

    return true
  end

  def enough_seats?
      self.line_items.each do |item|
        # assume that bus is only booked for one tour per day, so only get the first item
        booking = BusBooking.where(booking_date: item.booking_date, bus_id: item.bus.id, product_id: item.product.id ).first  

        if booking
          s = booking.seats_left - item.adults - item.children
          if s >= 0
            booking.seats_left = s 
          else
            # Error
            item.destroy
            errors.add(:base, "Sorry, your checkout took too long to complete, there are not enough seats left now for '#{item.variant.product.name}' on #{item.booking_date}. This item has been removed from your cart. You can still attempt to checkout with your other items.") and return false
          end

        else
          # does this bus have a booking for this day for any other products?
          b = BusBooking.where(booking_date: item.booking_date, bus_id: item.bus.id).first
          
          if b == nil
            # booking = Booking.new( booking_date: item.booking_date, bus_id: item.bus.id, product: item.variant.product, seats_left: item.bus.seats )
            booking = BusBooking.new( booking_date: item.booking_date, bus_id: item.bus.id, product_id: item.variant.product.id, seats_left: item.bus.seats - item.adults - item.children )
          else
            return
          end
        end
        
        item.bus_booking = booking
        item.save
        booking.save
      end

  end


end

Spree::Order.state_machine.before_transition :to => :complete, :do => :enough_seats?

