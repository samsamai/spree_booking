Deface::Override.new(:virtual_path => "spree/admin/orders/_shipment",
                     :name => "change_booking header_shipment1",
                     :remove => "[data-hook='stock-contents'] > colgroup"
)                     
Deface::Override.new(:virtual_path => "spree/admin/orders/_shipment",
                     :name => "change_booking header_shipment2",
                     :remove => "[data-hook='stock-contents'] > thead"
)                     

Deface::Override.new(:virtual_path => "spree/admin/orders/_shipment",
                     :name => "change_booking header_shipment3",
                     :insert_top => "[data-hook='stock-contents']",
                     :text => <<eos

<colgroup>
<col style="width: 10%;" />
<col style="width: 40%;" />
<col style="width: 20%;" />
<col style="width: 5%;" />
<col style="width: 5%;" />
<col style="width: 5%;" />
<col style="width: 15%;" />
</colgroup>

<thead>
<th colspan="2"><%= Spree.t(:item_description) %></th>
<th><%= Spree.t(:booking_date) %></th>
<th><%= Spree.t(:adults) %></th>
<th><%= Spree.t(:children) %></th>
<th><%= Spree.t(:under4ss) %></th>
<th><%= Spree.t(:total) %></th>
<th class="orders-actions actions" data-hook="admin_order_form_line_items_header_actions"></th>
</thead>
eos
)            


