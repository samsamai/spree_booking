Deface::Override.new(:virtual_path => 'spree/orders/_form',
                     :name => "change_line_item_data_display2",
                     :replace_contents => "table#cart-detail",
                     :text => 
<<eos
                       <thead>
                         <tr data-hook="cart_items_headers">
                                <th class="cart-item-description-header" colspan="2"><%= Spree.t(:item) %></th>
                                <th class="cart-item-booking-date-header" colspan="1"><%= Spree.t(:booking_date) %></th>
                                <th class="cart-item-adults-header hidden-xs">Adults</th>
                                <th class="cart-item-children-header hidden-xs">Children</th>
                                <th class="cart-item-under4-header hidden-xs">Under 4s%></th>
                                <th class="cart-item-total-header"><%= Spree.t(:total) %></th>
                                <th class="cart-item-delete-header"></th>
                         </tr>
                       </thead>
                       <tbody id="line_items" data-hook>
                         <%= render partial: 'line_item', collection: order_form.object.line_items, locals: {order_form: order_form} %>
                       </tbody>
                       <% if @order.adjustments.exists? || @order.line_item_adjustments.exists? || @order.shipment_adjustments.exists? %>
                         <tr class="cart-subtotal">
                           <td colspan="6" align='right'><h5><%= Spree.t(:cart_subtotal, :count => @order.line_items.sum(:quantity)) %></h5></th>
                           <td colspan><h5><%= order_form.object.display_item_total %></h5></td>
                           <td></td>
                         </tr>
                         <%= render "spree/orders/adjustments" %>
                       <% end %>
                       <tr class="cart-total">
                       <td></td>
                       <td></td>
                       <td class="hidden-xs"></td>
                       <td class="hidden-xs"></td>
                       <td class="hidden-xs"></td>
                       
                         <td align='right'><h5><%= Spree.t(:total) %></h5></th>
                         <td class="align-center" ><h5 ><%= order_form.object.display_total %></h5></td>
                         <td></td>
                       </tr> 
eos
)            
