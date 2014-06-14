Deface::Override.new(:virtual_path => 'spree/orders/_form',
                     :name => "change_line_item_data_display2",
                     :replace_contents => "table#cart-detail",
                     :text => 
<<eos
                       <thead>
                         <tr data-hook="cart_items_headers">
                                <th class="cart-item-description-header" colspan="2"><%= Spree.t(:item) %></th>
                                <th class="cart-item-booking-date-header" colspan="1"><%= Spree.t(:booking_date) %></th>
                                <th class="cart-item-adults-header"><%= Spree.t(:adults) %></th>
                                <th class="cart-item-children-header"><%= Spree.t(:children) %></th>
                                <th class="cart-item-under4-header"><%= Spree.t(:under_4s) %></th>
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
                         <td colspan="6" align='right'><h5><%= Spree.t(:total) %></h5></th>
                         <td class="align-center" ><h5 ><%= order_form.object.display_total %></h5></td>
                         <td></td>
                       </tr> 
eos
)            

# Deface::Override.new(:virtual_path => 'spree/orders/_form',
#                      :name => "change_line_item_data_display",
#                      :replace_contents => ":root",
#                      :text => <<eos
# <%= render :partial => 'spree/shared/error_messages', :locals => { :target => @order } %>
# <table id="cart-detail" data-hook>
#   <thead>
#     <tr data-hook="cart_items_headers">
#     <th class="cart-item-description-header" colspan="2"><%= Spree.t(:item) %></th>
#     <th class="cart-item-booking-date-header" colspan="1"><%= Spree.t(:booking_date) %></th>
#     <th class="cart-item-adults-header"><%= Spree.t(:adults) %></th>
#     <th class="cart-item-children-header"><%= Spree.t(:children) %></th>
#     <th class="cart-item-under4-header"><%= Spree.t(:under_4s) %></th>
#     <th class="cart-item-total-header"><%= Spree.t(:total) %></th>
#     <th class="cart-item-delete-header"></th>
#     </tr>
#   </thead>
#   <tbody id="line_items" data-hook>
#     <%= render partial: 'line_item', collection: order_form.object.line_items, locals: {order_form: order_form} %>
#   </tbody>
#   <% if @order.adjustments.exists? || @order.line_item_adjustments.exists? || @order.shipment_adjustments.exists? %>
#     <tr class="cart-subtotal">
#       <td colspan="6" align='right'><h5><%= Spree.t(:cart_subtotal, :count => @order.line_items.sum(:quantity)) %></h5></th>
#       <td colspan><h5><%= order_form.object.display_item_total %></h5></td>
#       <td></td>
#     </tr>
#     <%= render "spree/orders/adjustments" %>
#   <% end %>
#   <tr class="cart-total">
#     <td colspan="6" align='right'><h5><%= Spree.t(:total) %></h5></th>
#     <td colspan><h5><%= order_form.object.display_total %></h5></td>
#     <td></td>
#   </tr>
# </table>
# eos
# )          

# Deface::Override.new(:virtual_path => 'spree/orders/_form',
#                      :name => "change_line_item_data_display",
#                      :replace => "th.cart-item-description-header",
#                      :closing_selector => "th.cart-item-delete-header",
#                      :text => <<eos
#                      <th class="cart-item-description-header" colspan="2"><%= Spree.t(:item) %></th>
#                      <th class="cart-item-booking-date-header" colspan="1"><%= Spree.t(:booking_date) %></th>
#                      <th class="cart-item-adults-header"><%= Spree.t(:adults) %></th>
#                      <th class="cart-item-children-header"><%= Spree.t(:children) %></th>
#                      <th class="cart-item-under4-header"><%= Spree.t(:under_4s) %></th>
#                      <th class="cart-item-total-header"><%= Spree.t(:total) %></th>
#                      <th class="cart-item-delete-header"></th>
 
# eos
# )         
