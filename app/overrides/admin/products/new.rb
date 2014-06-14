Deface::Override.new(:virtual_path => "spree/admin/products/new",
                     :name => "admin_products_new_add_child_price",
                     :insert_before => "[data-hook='new_product_attrs'] div.omega.four.columns",
                     :text => <<eos
                     <div data-hook="new_product_child_price" class="four columns">
                       <%= f.field_container :child_price do %>
                         <%= f.label :child_price, Spree.t(:child_price) %> <span class="required">*</span><br />
                         <%= f.text_field :child_price, :value => number_to_currency(@product.child_price, :unit => ''), :class => 'fullwidth' %>
                         <%= f.error_message_on :child_price %>
                       <% end %>
                     </div>
eos
)            


