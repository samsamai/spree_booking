Deface::Override.new(:virtual_path => 'spree/orders/_line_item',
                     :name => "change_line_item_data_display",
                     :replace => "td.cart-item-price",
                     :closing_selector => "td.cart-item-total",
                     :text => <<eos
                       <td class="cart-item-booking-date" data-hook="cart_item_booking_date">
                         <%= item_form.label :booking_date, line_item.booking_date.to_s %>
                       </td>
                       <td class="cart-item-adults" data-hook="cart_item_adults" >
                         <%= line_item.adults.to_s %>
                       </td>
                       <td class="cart-item-children" data-hook="cart_item_children" >
                         <%= line_item.children.to_s %>
                       </td>
                       <td class="cart-item-under4" data-hook="under4" >
                         <%= line_item.under4.to_s %>
                       </td>
                       <td class="cart-item-total" data-hook="cart_item_total">
                         <%= line_item.display_amount.to_html unless line_item.quantity.nil? %>
                       </td>
                       <td class="cart-item-quantity" data-hook="cart_item_quantity">
                         <%= item_form.hidden_field :quantity, :min => 0, :class => "line_item_quantity", :size => 5 %>
                       </td>

                     
eos
)