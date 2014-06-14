Spree::Api::LineItemsController.class_eval do
  def destroy

    @line_item = find_line_item
    # Rails.logger.debug( "!!!!!!!!!" )
    # Rails.logger.debug( "HOOKING THE DESTROY!!!" )
    # Rails.logger.debug( "@line_item.bus_booking.seats_left = #{@line_item.bus_booking.seats_left}" )
    # Rails.logger.debug( "@line_item.adults = #{@line_item.adults}" )
    # Rails.logger.debug( "@line_item.children = #{@line_item.children}" )

    # Give seats back before destroying the lineitem
    @line_item.bus_booking.seats_left = @line_item.bus_booking.seats_left + @line_item.adults + @line_item.children
    if @line_item.bus_booking.seats_left == @line_item.bus.seats
      @line_item.bus_booking.destroy
    else
      @line_item.bus_booking.save
    end

    variant = Spree::Variant.find(@line_item.variant_id)
    @order.contents.remove(variant, @line_item.quantity)
    @order.ensure_updated_shipments
    respond_with(@line_item, status: 204)
  end
end
