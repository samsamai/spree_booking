Spree::ProductsController.class_eval do
    # before_filter :load_product, :only => :seats_left
    
    def show
        @params = params.slice(:book_now)
        return unless @product

        @variants = @product.variants_including_master.active(current_currency).includes([:option_values, :images])
        sp_variants = @product.variants.active(current_currency).includes([:option_values, :images])
        @product_properties = @product.product_properties.includes(:property)

        # disabled_dates = ["14-06-2014", "15-06-2014", "16-06-2014"]
        disabled_dates = @product.get_disabled_dates
        
        # Pass combination data to js via gon
        gon.disabled_dates = disabled_dates
        gon.product_id = @product.id
        gon.variant_id = @product.master.id
        gon.book_now = params[:book_now]
    end

  def seats_left
    date = Date.strptime( params[:date], '%d-%m-%Y' )
    product_id = params[:product_id]
    product = Spree::Product.find( product_id )
    @available_bus = product.get_available_bus( date )

    respond_to do |format|
      format.js   { 
      }
    end
  end

    private


    # def get_available_seats( date, bus)
    #     bus_booking = BusBooking.where( booking_date: date, bus_id: bus.id).first
    #     if bus_booking
    #         return bus_booking.seats_left
    #     else
    #         return bus.seats
    #     end
    # end


    
end
