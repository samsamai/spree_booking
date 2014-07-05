# Deface::Override.new(:virtual_path => 'spree/shared/_order_details',
#                      :name => "change_theader_order_details",
#                      :replace_contents => "[data-hook='order_details_line_items_headers']",
#                      :text => <<eos
#                          <th colspan="2"><%= Spree.t(:item) %></th>
#                          <th colspan="2"><%= Spree.t(:booking_date) %></th>
#                          <th><%= Spree.t(:adults) %></th>
#                          <th><%= Spree.t(:children) %></th>
#                          <th><%= Spree.t(:under4) %></th>
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
#                      <td data-hook="order_item_booking_date"><span><%= item.booking_date %></span></td>
#                     <td data-hook="order_item_adults"><%= item.adults %></td>
#                     <td data-hook="order_item_children"><%= item.children %></td>
#                     <td data-hook="order_item_under4"><%= item.under4 %></td>
#                      <td data-hook="order_item_total" class="total"><span><%= item.display_amount.to_html %></span></td>

# eos
# )            

Deface::Override.new(:virtual_path => 'spree/shared/_order_details',
                     :name => "change_shared_order_details",
                     :replace_contents => "[data-hook='order_details']",
                     :text => <<eos
  <col width="15%" valign="middle" halign="center">
  <col width="55%" valign="middle">
  <col width="10%" valign="middle" halign="center">
  <col width="5%" valign="middle" halign="center">
  <col width="5%" valign="middle" halign="center">
  <col width="5%" valign="middle" halign="center">
  <col width="5%" valign="middle" halign="center">

  <thead data-hook>
    <tr data-hook="order_details_line_items_headers">
      <th colspan="2"><%= Spree.t(:item) %></th>
      <th><%= Spree.t(:booking_date) %></th>
      <th class="hidden-xs">Adults</th>
      <th class="hidden-xs">Children</th>
      <th class="hidden-xs">Under 4s</th>
      <th class="total"><span><%= Spree.t(:total) %></span></th>
    </tr>
  </thead>

  <tbody data-hook>
    <% @order.line_items.each do |item| %>
      <tr data-hook="order_details_line_item_row">
       <td data-hook="order_item_image">
         <% if item.variant.images.length == 0 %>
           <%= link_to small_image(item.variant.product), item.variant.product %>
         <% else %>
           <%= link_to image_tag(item.variant.images.first.attachment.url(:small)), item.variant.product %>
         <% end %>
       </td>
       <td data-hook="order_item_description">
         <h4><%= item.variant.product.name %></h4>
       </td>
       <td data-hook="order_item_booking_date"><span><%= item.booking_date %></span></td>
      <td class="hidden-xs" data-hook="order_item_adults"><%= item.adults %></td>
      <td class="hidden-xs" data-hook="order_item_children"><%= item.children %></td>
      <td class="hidden-xs" data-hook="order_item_under4"><%= item.under4 %></td>
       <td data-hook="order_item_total" class="total"><span><%= item.display_amount.to_html %></span></td>
      </tr>
    <% end %>
  </tbody>
  <tfoot id="order-total" data-hook="order_details_total">
    <tr class="total">
      <td></td>
      <td></td>
      <td class="hidden-xs"></td>
      <td class="hidden-xs"></td>
      <td class="hidden-xs"></td>
      <td ><b><%= Spree.t(:order_total) %>:</b></td>
      <td class="total"><span id="order_total"><%= @order.display_total.to_html %></span></td>
    </tr>
  </tfoot>

  <tfoot id="subtotal" data-hook="order_details_subtotal">
    <tr class="total" id="subtotal-row">
    <td></td>
    <td></td>
    <td class="hidden-xs"></td>
    <td class="hidden-xs"></td>
    <td class="hidden-xs"></td>
      <td ><b><%= Spree.t(:subtotal) %>:</b></td>
      <td class="total"><span><%= @order.display_item_total.to_html %></span></td>
    </tr>
  </tfoot>

  <% if @order.line_item_adjustments.exists? %>
    <% if order.all_adjustments.promotion.eligible.exists? %>
      <tfoot id="price-adjustments" data-hook="order_details_price_adjustments">
        <% order.all_adjustments.promotion.eligible.group_by(&:label).each do |label, adjustments| %>
          <tr class="total">
            <td colspan="6"><%= Spree.t(:promotion) %>: <strong><%= label %></strong></td>
            <td class="total"><span><%= Spree::Money.new(adjustments.sum(&:amount), currency: order.currency) %></span></td>
          </tr>
        <% end %>
      </tfoot>
    <% end %>
  <% end %>

  <tfoot id='shipment-total'>
    <% order.shipments.group_by { |s| s.selected_shipping_rate.name }.each do |name, shipments| %>
      <tr class="total" data-hook='shipment-row'>
        <td colspan="6"><%= Spree.t(:shipping) %>: <strong><%= name %></strong></td>
        <td class="total"><span><%= Spree::Money.new(shipments.sum(&:discounted_cost), currency: order.currency).to_html %></span></td>
      </tr>
    <% end %>
  </tfoot>

  <% if order.all_adjustments.tax.exists? %>
    <tfoot id="tax-adjustments" data-hook="order_details_tax_adjustments">
      <% order.all_adjustments.tax.group_by(&:label).each do |label, adjustments| %>
        <tr class="total">
          <td colspan="6"><%= Spree.t(:tax) %>: <strong><%= label %></strong></td>
          <td class="total"><span><%= Spree::Money.new(adjustments.sum(&:amount), currency: order.currency) %></span></td>
        </tr>
      <% end %>
    </tfoot>
  <% end %>

  <tfoot id="order-charges" data-hook="order_details_adjustments">
    <% @order.adjustments.eligible.each do |adjustment| %>
    <% next if (adjustment.source_type == 'Spree::TaxRate') and (adjustment.amount == 0) %>
      <tr class="total">
      <td></td>
      <td></td>
      <td class="hidden-xs"></td>
      <td class="hidden-xs"></td>
      <td class="hidden-xs"></td>
        <td><strong><%= adjustment.label %></strong></td>
        <td class="total"><span><%= adjustment.display_amount.to_html %>test</span></td>
      </tr>
    <% end %>
  </tfoot>


eos
)            
