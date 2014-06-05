Deface::Override.new(:virtual_path => 'spree/checkout/_delivery',
                     :name => "change_checkout_delivery_data_display",
                     :replace => "[data-hook='stock-contents']",
                     :text => <<eos
                     <table class="stock-contents" data-hook="stock-contents">
                       <colgroup>
                         <col style="width: 10%;" />
                         <col style="width: 35%;" />
                         <col style="width: 20%;" />
                         <col style="width: 5%;" />
                         <col style="width: 5%;" />
                         <col style="width: 5%;" />
                         <col style="width: 20%;" />
                       </colgroup>
                       <thead>
                         <th></th>
                         <th align='left'><%= Spree.t(:item) %></th>
                         <th><%= Spree.t(:booking_date) %></th>
                         <th><%= Spree.t(:adults) %></th>
                         <th><%= Spree.t(:children) %></th>
                         <th><%= Spree.t(:under_4s) %></th>
                         <th><%= Spree.t(:price) %></th>
                       </thead>
                       <tbody>
                         <% ship_form.object.manifest.each do |item| %>
                           <tr class="stock-item">
                             <td class="item-image"><%= mini_image(item.variant) %></td>
                             <td class="item-name"><%= item.variant.name %></td>
                             <td class="item-booking_date"><%= item.line_item.booking_date %></td>
                             <td class="item-adults"><%= item.line_item.adults  %></td>
                             <td class="item-children"><%= item.line_item.children %></td>
                             <td class="item-under4"><%= item.line_item.under4  %></td>
                             <td class="item-price"><%= item.line_item.money %></td>
                           </tr>
                         <% end %>
                       </tbody>
                     </table>
                     
eos
)