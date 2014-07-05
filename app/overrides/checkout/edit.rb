Deface::Override.new(:virtual_path => 'spree/checkout/edit',
                     :name => "change_checkout_header",
                     :replace => "[data-hook='checkout_header']",
                     :text => <<eos
                     <div class="col-sm-12">
                       <h1 data-hook="checkout_title"><%= Spree.t(:checkout) %></h1>
                     </div>
                     <div class="col-sm-12" data-hook="checkout_progress"><%= checkout_progress %></div>
                     
eos
)

# <div class="row" data-hook="checkout_header">
#     <div class="col-sm-3">
#       <h1 data-hook="checkout_title"><%= Spree.t(:checkout) %></h1>
#     </div>
#     <div class="col-sm-9" data-hook="checkout_progress"><%= checkout_progress %></div>
#   </div>