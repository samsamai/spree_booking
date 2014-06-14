Deface::Override.new(:virtual_path => 'spree/products/_cart_form',
                     :name => "add_booking_info1",
                     :insert_top => "[data-hook='inside_product_cart_form']",
                     :text => <<eos
<br>
<%= content_tag "div", "data-hook" => "booking-info", class: "columns four alpha", data: {master_price: @product.price_in(current_currency).amount } do %>

<%= f.label :booking_date %> <%= text_field_tag :booking_date, nil, readonly: true %>
<%= f.label :adults %> <%= number_field_tag :adults, 1, min: 1, origvalue: 1  %>                 
<%= f.label :children %> <%= number_field_tag :children, 0, min: 0, origvalue: 0   %>                 
<%= f.label :under4 %> <%= number_field_tag :under4, 0, min: 0, origvalue: 0   %>
<%= hidden_field_tag :bus_id %>

<% end %>
eos
)            

Deface::Override.new(:virtual_path => 'spree/products/_cart_form',
                     :name => "add_booking_info2",
                     :insert_top => "#product-price",
                     :text => <<eos
<h6><%= Spree.t(:seats_left) %></h6>
  <span id="seats_left">
    <%= @available_bus.nil? ? 'No seats available.' : @available_bus[:seats_left ] %>
  </span>

eos
)            

Deface::Override.new(:virtual_path => 'spree/products/_cart_form',
                     :name => "add_booking_info3",
                     :replace_contents => "div.add-to-cart",
                     :text => <<eos
                     <%= hidden_field_tag :quantity, 1, :class => 'title', :min => 1 %>
                     <%= button_tag :class => 'large primary', :id => 'add-to-cart-button', :type => :submit do %>
                       <%= Spree.t(:add_to_cart) %>
                     <% end %>
eos
)            

