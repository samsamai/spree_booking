Deface::Override.new(:virtual_path => "spree/admin/orders/_shipment_manifest",
                     :name => "change_shipment_manifest_for_booking",
                     :replace_contents => "tr.stock-item",
                     :text => <<eos
    <td class="item-image">
      <%= mini_image(item.variant) %>
    </td>
    <td class="item-name">
      <%= item.variant.product.name %><br><%= "(" + variant_options(item.variant) + ")" unless item.variant.option_values.empty? %>
      <% if item.variant.sku.present? %>
        <strong><%= Spree.t(:sku) %>:</strong> <%= item.variant.sku %>
      <% end %>
    </td>
    <td class="item-booking_date align-center"><%= item.line_item.booking_date %></td>
    <td class="item-adults align-center"><%= item.line_item.adults %></td>
    <td class="item-children align-center"><%= item.line_item.children %></td>
    <td class="item-under4 align-center"><%= item.line_item.under4 %></td>

    <td class="item-total align-center"><%= item.line_item.money %></td>
    <% unless shipment.shipped? %>
      <td class="cart-item-delete actions" data-hook="cart_item_delete">
        <% if can? :update, item %>
          <%= link_to '', '#', :class => 'save-item fa fa-check no-text with-tip', :data => {'shipment-number' => shipment.number, 'variant-id' => item.variant.id, :action => 'save'}, :title => Spree.t('actions.save'), :style => 'display: none' %>
          <%= link_to '', '#', :class => 'cancel-item fa fa-cancel no-text with-tip', :data => {:action => 'cancel'}, :title => Spree.t('actions.cancel'), :style => 'display: none' %>
          <%= link_to '', '#', :class => 'edit-item fa fa-edit no-text with-tip', :data => {:action => 'edit'}, :title => Spree.t('edit') %>
          <%= link_to '', '#', :class => 'split-item icon_link fa fa-arrows-h no-text with-tip', :data => {:action => 'split', 'variant-id' => item.variant.id}, :title => Spree.t('split') %>
          <%= link_to '', '#', :class => 'delete-item fa fa-trash no-text with-tip', :data => { 'shipment-number' => shipment.number, 'variant-id' => item.variant.id, :action => 'remove'}, :title => Spree.t('delete') %>
        <% end %>
      </td>
    <% end %>
eos
)            
