require 'spec_helper'

describe Spree::Order  do
  let(:bus) {create( :bus )}
  let(:product) {create( :product, child_price: 5 )}
  let(:variant) {product.master}

  before(:each) do
    @li = create( :line_item, variant: variant, booking_date: Date.today, adults: 1, children: 1, under4: 0,
    bus: bus )
    @order = create( :order, line_items: [@li])
  end

  it "should be valid" do
    # Spree::LineItem.create(@valid_attributes)
    
    order = create( :order, line_items: [@li])
  end
  
  it "should respond to enough_seats?" do
    @order.should respond_to :enough_seats?
  end
  
  
  describe "#enough_seats?" do
    it "should make booking if enough seats available" do
      # Spree::LineItem.create(@valid_attributes)
    
      @li = create( :line_item, variant: variant, booking_date: Date.today, adults: 1, children: 1, under4: 0,
      bus: bus )
      
       expected = BusBooking.count
       @order.enough_seats?
       result = BusBooking.count
     
       result.should eq expected + 1
    
    end
    
    it "with booking already there, it should make booking if enough seats available" do
      # Spree::LineItem.create(@valid_attributes)
      bus_booking2 = create( :bus_booking, booking_date: Date.today, bus_id: bus.id, product_id: product.id, seats_left: 5)
    
      @li = create( :line_item, variant: variant, booking_date: Date.today, adults: 1, children: 1, under4: 0,
      bus: bus )
      
       expected = bus_booking2.seats_left - 2
       @order.enough_seats?
       result = BusBooking.find( bus_booking2.id).seats_left
     
       result.should eq expected
    
    end
    
    it "with booking full, it should not make a booking" do
      # Spree::LineItem.create(@valid_attributes)
      bus_booking2 = create( :bus_booking, booking_date: Date.today, bus_id: bus.id, product_id: product.id, seats_left: 0)
    
      @li = create( :line_item, variant: variant, booking_date: Date.today, adults: 1, children: 1, under4: 0,
      bus: bus )
      
       before_n_bookings = BusBooking.count
       expected = 0
       @order.enough_seats?
       after_n_bookings = BusBooking.count
       
       result = BusBooking.find( bus_booking2.id).seats_left
     
       (result.should eq expected) && (before_n_bookings.should eq after_n_bookings)
    
    end
    
    it "with 2 seat left, it should make a booking for 2" do
      
      # Spree::LineItem.create(@valid_attributes)
      bus_booking2 = create( :bus_booking, booking_date: Date.tomorrow , bus_id: bus.id, product_id: product.id, seats_left: 2)
    
      li = create( :line_item, variant: variant, booking_date: Date.tomorrow, adults: 1, children: 1, under4: 0,
      bus: bus )
      order = create( :order, line_items: [li])
      
        
       expected = bus_booking2.seats_left - li.adults - li.children
       order.enough_seats?
       result = BusBooking.find( bus_booking2.id).seats_left
     
       (result.should eq expected) 
    
    end
    
    it "full booking for bus1, should add booking for bus 2" do
      
      # Spree::LineItem.create(@valid_attributes)
      bus_booking2 = create( :bus_booking, booking_date: Date.tomorrow , bus_id: bus.id, product_id: product.id, seats_left: 0)
    
      bus2 = create( :bus, seats: 9 )
      li = create( :line_item, variant: variant, booking_date: Date.tomorrow, adults: 1, children: 1, under4: 0,
      bus: bus2 )
      order = create( :order, line_items: [li])
      
        
      expected = BusBooking.count + 1
      order.enough_seats?
      result = BusBooking.count
    
      result.should eq expected
    end


    it "with 2 buses, 2 bookings with different products, 3rd booking not allowed" do
      date = Date.tomorrow
      bus2 = create( :bus, seats: 9 )
      
      product2 = create( :product, child_price: 5 )
      product3 = create( :product, child_price: 5 )
      variant3 = product3.master
      
      bus_booking1 = create( :bus_booking, booking_date: date , bus_id: bus.id, product_id: product.id, seats_left: 0)
      bus_booking2 = create( :bus_booking, booking_date: date , bus_id: bus2.id, product_id: product2.id, seats_left: 7)
    
      li = create( :line_item, variant: variant3, booking_date: date, adults: 1, children: 1, under4: 0,
      bus: bus2 )
      order = create( :order, line_items: [li])
      
        
      expected = BusBooking.count
      order.enough_seats?
      result = BusBooking.count
    
      result.should eq expected
    end

  end

end