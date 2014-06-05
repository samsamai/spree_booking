Deface::Override.new(:virtual_path => 'spree/shared/_head',
                     :name => "add_debuging_info",
                     :insert_before => "erb[loud]:contains('javascript_include_tag')",
                     :text => <<eos
<%= include_gon %>
<%= stylesheet_link_tag "http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/redmond/jquery-ui.css", "application" %>
eos
)            

