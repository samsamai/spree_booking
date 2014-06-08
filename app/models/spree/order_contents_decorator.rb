Spree::OrderContents.class_eval do

  
    # # Get current line item for variant if exists
    # # Add variant qty to line_item
    # def add(variant, quantity = 1, currency = nil, shipment = nil, uploaded_file )
    #   line_item = order.find_line_item_by_variant(variant)
    #   add_to_line_item(line_item, variant, quantity, currency, shipment, uploaded_file )
    # end
    
    # private
    
    # def add_to_line_item(line_item, variant, quantity, currency=nil, shipment=nil, uploaded_file)
      
    #   line_item = order.line_items.new(quantity: quantity, variant: variant)
    #   line_item.target_shipment = shipment
    #   if currency
    #     line_item.currency = currency unless currency.nil?
    #     line_item.price    = variant.price_in(currency).amount
    #   else
    #     line_item.price    = variant.price
    #   end
    
    #   line_item.upf = uploaded_file
      
    #   line_item.save
    #   order.reload
    #   line_item
    # end



    def add(variant, quantity = 1, currency = nil, shipment = nil, booking_date, adults, children, under4, bus )
      line_item = add_to_line_item(variant, quantity, currency, shipment, booking_date, adults, children, under4, bus )
      reload_totals
      # PromotionHandler::Cart.new(order, line_item).activate
      # ItemAdjustments.new(line_item).update
      reload_totals
      line_item
    end

    private

    def add_to_line_item(variant, quantity, currency=nil, shipment=nil, booking_date, adults, children, under4, bus )
      line_item = grab_line_item_by_variant(variant)

      if line_item
        line_item.target_shipment = shipment
        line_item.quantity += quantity.to_i
        line_item.currency = currency unless currency.nil?
      else
        line_item = order.line_items.new(quantity: quantity, variant: variant )
        line_item.target_shipment = shipment
        if currency
          line_item.currency = currency
          line_item.price    = variant.price_in(currency).amount
        else
          line_item.price    = variant.price
        end
      end

      if booking_date == ''
        line_item.booking_date = nil
      else
        line_item.booking_date = Date.strptime(booking_date, '%d-%m-%Y')
      end

      line_item.adults = adults.to_i
      line_item.children = children.to_i
      line_item.under4 = under4.to_i
      line_item.bus = bus

      line_item.save
      line_item
    end


end

