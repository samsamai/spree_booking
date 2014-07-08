Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "admin_products_form_add_child_price",
                     :insert_before => "[data-hook='admin_product_form_right'] div.alpha.two.columns",
                     :text => <<eos
                     <%= f.field_container :child_price do %>
                       <%= f.label :child_price, raw(Spree.t(:child_price) + content_tag(:span, ' *', :class => "required")) %>
                       <%= f.text_field :child_price, :value => number_to_currency(@product.child_price, :unit => '') %>
                       <%= f.error_message_on :child_price %>
                     <% end %>
eos
)            

Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "admin_products_form_add_short_description",
                     :insert_bottom => "[data-hook='admin_product_form_additional_fields']",
                     :text => <<eos
                     <%= f.field_container :short_description do %>
                       <%= f.label :short_description, 'Short description' %>
                       <%= f.text_area :short_description, {:rows => '13', :class => 'fullwidth'} %>
                       <%= f.error_message_on :short_description %>
                     <% end %>
eos
)            
