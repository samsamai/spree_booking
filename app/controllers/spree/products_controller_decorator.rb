Spree::ProductsController.class_eval do
    # before_filter :load_product, :only => :seats_left
    
    def show
        return unless @product

        @variants = @product.variants_including_master.active(current_currency).includes([:option_values, :images])
        sp_variants = @product.variants.active(current_currency).includes([:option_values, :images])
        @product_properties = @product.product_properties.includes(:property)

        # disabled_dates = ["14-06-2014", "15-06-2014", "16-06-2014"]
        disabled_dates = @product.get_disabled_dates
        
        # Pass combination data to js via gon
        gon.disabled_dates = disabled_dates
        gon.product_id = @product.id
    end

    def disabled_products
      date = params[:date]
      @disabled_products= [20]
      
      Spree::Product.all.each do |product|
        if !product.get_available_bus( date )
          @disabled_products << product.id
        end
      end

      respond_to do |format|
        format.js   { 
        }
      end

    end

    def disabled_dates
      product_id = params[:product_id]
      Rails.logger.debug( "DEBUG: product_id = '#{product_id}'" )
      product = Spree::Product.find( product_id )
      
      Rails.logger.debug( "DEBUG: disabled_dates = '#{gon.disabled_dates}'" )
      @disabled_dates = product.get_disabled_dates.to_json.html_safe
      @variant_id = product.master.id
      
      respond_to do |format|
        format.js   { 
        }
      end
    end
    
  def seats_left
    date = params[:date]
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
