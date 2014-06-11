# lib/spree/permitted_attributes_decorator.rb
Spree::PermittedAttributes.class_eval do
  # @@order_attributes.push(:date)
  @@product_attributes.push(:child_price)
  # @@variant_attributes.push(:child_price)
end
