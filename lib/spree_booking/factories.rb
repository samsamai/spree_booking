FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_booking/factories'
  
  factory :bus do
    name 'Test Bus'
    seats 12
  end
  
  factory :bus_booking do
    seats_left 12
  end
  
  factory :booking_product, :parent => :product do
    child_price 10
  end
  
  factory :booking_line_item, :parent => :line_item do
    adult 1
    child 1
    under4 0
    booking_date Date.today
    
  end
  
  # factory :booking_variant, parent: :variant do
  #   product { create(:booking_product) }
  # end
  
end
