Deface::Override.new(:virtual_path => 'spree/shared/_footer',
                     :name => "add_debuging_info",
                     :insert_after => "footer#footer",
                     :text => <<eos
<%= debug(params) if Rails.env.development? %>
eos
)            
