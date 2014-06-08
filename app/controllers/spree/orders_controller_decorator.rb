Spree::OrdersController.class_eval do
  # Adds a new item to the order (creating a new order if none already exists)
  def populate
    # Rails.logger.debug( "DEBUG: booking_date = #{params[:booking_date]}" )

    # Todo: fix up creation of buses
    #  for now assume we have one bus with 11 seats
    bus = Bus.find(params[:bus_id])
    populator = Spree::OrderPopulator.new(current_order(create_order_if_necessary: true), current_currency)
    if populator.populate(params[:variant_id], params[:quantity], params[:booking_date], params[:adults], params[:children], params[:under4], bus )

      current_order.ensure_updated_shipments

      respond_with(@order) do |format|
        format.html { redirect_to cart_path }
      end
    else
      flash[:error] = populator.errors.full_messages.join(" ")
      redirect_to :back
    end
  end


end
