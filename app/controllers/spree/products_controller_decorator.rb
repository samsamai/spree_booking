Spree::ProductsController.class_eval do
    
    def show
        return unless @product

        @variants = @product.variants_including_master.active(current_currency).includes([:option_values, :images])
        sp_variants = @product.variants.active(current_currency).includes([:option_values, :images])
        @product_properties = @product.product_properties.includes(:property)

        disabled_dates = ["14-06-2014", "15-06-2014", "16-06-2014"]
        # Rails.logger.debug( "DEBUG: @combi = #{@combi}" )
        
        # Pass combination data to js via gon
        gon.disabled_dates = disabled_dates
    end

    
end
