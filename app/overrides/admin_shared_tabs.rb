Deface::Override.new(:virtual_path => 'spree/admin/shared/_tabs',
                     :name => "add_booking_to_admin_tabs",
                     :insert_before => "erb[silent]:contains('Spree::Product')",
                     :text => <<eos
<% if can? :admin, Spree::Admin::BookingsController %>
  <%= tab :bookings, :url => spree.admin_bookings_path, :icon => 'shopping-cart' %>
<% end %>
eos
)            



# <% if can? :admin, Spree::Order %>
#   <%= tab :orders, :payments, :creditcard_payments, :shipments, :credit_cards, :return_authorizations, :icon => 'shopping-cart' %>
# <% end %>
# <% if can? :admin, Spree::Product %>
#   <%= tab :products, :option_types, :properties, :prototypes, :variants, :product_properties, :taxonomies, :icon => 'th-large' %>
# <% end %>
# <% if can? :admin, Spree::Admin::ReportsController %>
#   <%= tab :reports, :icon => 'file'  %>
# <% end %>
# <%= tab :configurations, :general_settings, :mail_methods, :tax_categories, :tax_rates, :tax_settings, :zones, :countries, :states, :payment_methods, :shipping_methods, :shipping_categories, :stock_transfers, :stock_locations, :trackers, :label => 'configuration', :icon => 'wrench', :url => spree.edit_admin_general_settings_path %>
# <% if can? :admin, Spree::Promotion %>
#   <%= tab(:promotions, :url => spree.admin_promotions_path, :icon => 'bullhorn') %>
# <% end %>
# <% if Spree.user_class && can?(:admin, Spree.user_class) %>
#   <%= tab(:users, :url => spree.admin_users_path, :icon => 'user') %>
# <% end %>
