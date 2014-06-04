Deface::Override.new(:virtual_path => 'spree/products/_cart_form',
                     :name => "add_debuging_info",
                     :insert_top => "[data-hook='inside_product_cart_form']",
                     :text => <<eos
<br>
<%= content_tag "div", "data-hook" => "booking-info", class: "columns four alpha", data: {master_price: @product.price_in(current_currency).amount } do %>

<%= f.label :booking_date %> <%= text_field_tag :booking_date, nil, readonly: true %>
<%= f.label :adults %> <%= number_field_tag :adults, 1, min: 1 %>                 
<%= f.label :children %> <%= number_field_tag :children, 0, min: 0 %>                 
<%= f.label :under4 %> <%= number_field_tag :under4, 0, min: 0 %>

<% end %>
eos
)            
