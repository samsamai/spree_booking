Spree::ProductsController.class_eval do
    
    def show
        return unless @product

        @variants = @product.variants_including_master.active(current_currency).includes([:option_values, :images])
        sp_variants = @product.variants.active(current_currency).includes([:option_values, :images])
        @product_properties = @product.product_properties.includes(:property)

        # disabled_dates = ["14-06-2014", "15-06-2014", "16-06-2014"]
        disabled_dates = get_disabled_dates( @product )
        
        # Pass combination data to js via gon
        gon.disabled_dates = disabled_dates
    end

  def seats_left
    date = params[:date]

    @available_bus = get_available_seats( date )

    respond_to do |format|
      format.js   { 
      }
    end
  end

    private

    def get_available_seats( date )
        buses = Bus.all
        return_data = {}
        buses.each do |bus|
            seats_left = bus_available?(date, bus)

            if seats_left
                available_bus = { bus: bus, seats_left: seats_left}
                return available_bus
            end
        end
        return available_bus
    end

    # def get_available_seats( date, bus)
    #     bus_booking = BusBooking.where( booking_date: date, bus_id: bus.id).first
    #     if bus_booking
    #         return bus_booking.seats_left
    #     else
    #         return bus.seats
    #     end
    # end

    def get_disabled_dates( product )
        disabled_dates = []

        bus_bookings = BusBooking.all
        bus_bookings.each do |bus_booking|
            if get_available_bus( product, bus_booking.booking_date ) == false
                disabled_dates << bus_booking.booking_date.strftime("%d-%m-%Y")
            end
        end

        return disabled_dates
    end

    def get_available_bus( product, date )
        buses = Bus.all
        available = false
        available_bus = nil

        buses.each do |bus|
            if bus_available? date, bus
                available = true
                available_bus = bus
                break
            end
        end

        return available ? available_bus : false
    end

    def bus_available?( date, bus )
        bus_bookings = BusBooking.where( booking_date: date, bus_id: bus.id)
        if bus_bookings.length > 0
            bus_bookings.each do |bus_booking|
                if bus_booking.seats_left > 0
                    return bus_booking.seats_left
                else
                    return false
                end
            end
        else
            return bus.seats
        end

    end
    
end
