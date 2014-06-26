Deface::Override.new(:virtual_path => 'spree/orders/_line_item',
                     :name => "change_line_item_data_display",
                     :replace => "td.cart-item-price",
                     :closing_selector => "td.cart-item-total",
                     :text => <<eos
                       <td class="cart-item-booking-date align-center" data-hook="cart_item_booking_date">
                         <%= item_form.label :booking_date, line_item.booking_date.to_s %>
                       </td>
                       <td class="cart-item-adults align-center" data-hook="cart_item_adults" >
                         <%= line_item.adults.to_s %>
                       </td>
                       <td class="cart-item-children align-center" ata-hook="cart_item_children" >
                         <%= line_item.children.to_s %>
                       </td>
                       <td class="cart-item-under4 align-center" data-hook="under4" >
                         <%= line_item.under4.to_s %>
                       </td>
                       <td class="cart-item-total align-center" data-hook="cart_item_total">
                         <%= line_item.display_amount.to_html unless line_item.quantity.nil? %>
                       </td>
                       <td class="cart-item-quantity" style="display:none;" data-hook="cart_item_quantity">
                         <%= item_form.number_field :quantity, :min => 0, :class => "line_item_quantity", :size => 5 %>
                       </td>
                       

                     
eos
)

# <span class="line-item-description" data-hook="line_item_description">
#   <%= line_item_description_text(line_item.description) %>
# </span>
# <td data-hook="order_item_description">
#   <h4><%= item.variant.product.name %></h4>
#   <%= truncated_product_description(item.variant.product) %>
#   <%= "(" + item.variant.options_text + ")" unless item.variant.option_values.empty? %>
# </td>

Deface::Override.new(:virtual_path => 'spree/shared/_order_details',
                     :name => "change_line_item_data_display3",
                     :replace_contents => "[data-hook='order_item_description']",
                     :text => <<eos
                     <h4><%= item.variant.product.name %></h4>
eos
)



Deface::Override.new(:virtual_path => 'spree/orders/_line_item',
                     :name => "change_line_item_data_display2",
                     :replace_contents => "[data-hook='line_item_description']",
                     :text => <<eos
                     <%= line_item_description_text(line_item.name) %>
eos
)


# Deface::Override.new(:virtual_path => 'spree/orders/_line_item',
#                      :name => "change_line_item_data_display2",
#                      :insert_after => "tr",
#                      :text => <<eos
#                          <%= hidden_field_tag :quantity, :min => 0, :class => "line_item_quantity", :size => 5 %>
# eos
# )
#                      <% variant = line_item.variant -%>
# <%= order_form.fields_for :line_items, line_item do |item_form| -%>
#   <tr class="<%= cycle('', 'alt') %> line-item">
#     <td class="cart-item-image" data-hook="cart_item_image">
#       <% if variant.images.length == 0 %>
#         <%= link_to small_image(variant.product), variant.product %>
#       <% else %>
#         <%= link_to image_tag(variant.images.first.attachment.url(:small)), variant.product %>
#       <% end %>
#     </td>
#     <td class="cart-item-description" data-hook="cart_item_description">
#       <h4><%= link_to line_item.name, product_path(variant.product) %></h4>
#       <%= variant.options_text %>
#       <% if line_item.insufficient_stock? %>
#         <span class="out-of-stock">
#           <%= Spree.t(:out_of_stock) %>&nbsp;&nbsp;<br />
#         </span>
#       <% end %>
#       <span class="line-item-description" data-hook="line_item_description">
#         <%= line_item_description_text(line_item.description) %>
#       </span>
#     </td>
#     <td class="cart-item-price" data-hook="cart_item_price">
#       <%= line_item.single_money.to_html %>
#     </td>
#     <td class="cart-item-quantity" data-hook="cart_item_quantity">
#       <%= item_form.number_field :quantity, :min => 0, :class => "line_item_quantity", :size => 5 %>
#     </td>
#     <td class="cart-item-total" data-hook="cart_item_total">
#       <%= line_item.display_amount.to_html unless line_item.quantity.nil? %>
#     </td>
#     <td class="cart-item-delete" data-hook="cart_item_delete">
#       <%= link_to image_tag('icons/delete.png'), '#', :class => 'delete', :id => "delete_#{dom_id(line_item)}" %>
#     </td>
#   </tr>
# <% end -%>
