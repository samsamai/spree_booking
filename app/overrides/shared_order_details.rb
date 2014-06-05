# Deface::Override.new(:virtual_path => 'spree/shared/_order_details',
#                      :name => "change_theader_order_details",
#                      :replace_contents => "[data-hook='order_details_line_items_headers']",
#                      :text => <<eos
#                          <th colspan="2"><%= Spree.t(:item) %></th>
#                          <th colspan="2"><%= Spree.t(:artwork_filename) %></th>
#                          <th class="total"><span><%= Spree.t(:total) %></span></th>
# eos
# )            

# Deface::Override.new(:virtual_path => 'spree/shared/_order_details',
#                      :name => "change_order_line_item_details",
#                      :replace_contents => "[data-hook='order_details_line_item_row']",
#                      :text => <<eos
#                      <td data-hook="order_item_image">
#                        <% if item.variant.images.length == 0 %>
#                          <%= link_to small_image(item.variant.product), item.variant.product %>
#                        <% else %>
#                          <%= link_to image_tag(item.variant.images.first.attachment.url(:small)), item.variant.product %>
#                        <% end %>
#                      </td>
#                      <td data-hook="order_item_description">
#                        <h4><%= item.variant.product.name %></h4>
#                        <%= truncated_product_description(item.variant.product) %>
#                        <%= "(" + item.variant.options_text + ")" unless item.variant.option_values.empty? %>
#                      </td>
#                      <td class="total"><span></span></td>
#                      <td data-hook="order_item_filename" class="filename"><span><%= item.upf_filename %></span></td>
#                      <td data-hook="order_item_total" class="total"><span><%= item.display_amount.to_html %></span></td>

# eos
# )            