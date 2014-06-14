require 'spec_helper'

describe Spree::Product  do
  # let(:bus) {create( :bus )}
  # let(:product) {create( :product, child_price: 5 )}
  # let(:variant) {product.master}
  # 
  # before(:each) do
  #   @li = create( :line_item, variant: variant, booking_date: Date.today, adults: 1, children: 1, under4: 0,
  #   bus: bus )
  # end
  # 
  it "should be valid" do
    # Spree::LineItem.create(@valid_attributes)
    p = create( :product, :child_price => 5 )
  end
  
    
  describe "bus_available?" do
    let(:bus) {create( :bus )}
    let(:product) {create( :booking_product )}
    let(:bus_booking) {create( :bus_booking, booking_date: Date.today, bus_id: bus.id, product_id: product.id, seats_left: 5)}
    
    it "test dates" do
      expected = bus_booking.booking_date
      result = Date.today
    
      result.should eq expected
    end

    it "only one bus, 1 product booked, same product should be bookable (5 seats available)" do
      product.bus_available?( Date.tomorrow, bus ).should_not eq false
    end

    it "only one bus, 1 product booked, different product should not be bookable" do
      p2 = create(:booking_product )
      p2.bus_available?( bus_booking.booking_date, bus ).should eq false
    end
    
    it "should return number of seats" do
      expected = bus_booking.seats_left
      result = product.bus_available?( bus_booking.booking_date, bus )
      result.should eq expected
    end
    
    
    it "two buses, 1 product booked, this product should be bookable" do
      bus2 = create(:bus)
      p2 = create(:booking_product )
      p2.bus_available?( bus_booking.booking_date, bus2 ).should_not eq false
    end
    
    it "two buses, 2 product booked, third product should be not bookable" do
      bus2 = create(:bus)
      p2 = create(:booking_product )
      bus_booking2 = create( :bus_booking, booking_date: bus_booking.booking_date, bus_id: bus2.id, product_id: p2.id, seats_left: 4)
      p3 = create(:booking_product )
      p3.bus_available?( bus_booking.booking_date, bus2 ).should eq false
    end
    
  end

  describe "get_available_bus" do
    let(:bus) {create( :bus )}
    let(:product) {create( :booking_product )}
    let(:bus_booking) {create( :bus_booking, booking_date: Date.today, bus_id: bus.id, product_id: product.id, seats_left: 5)}
    
      it "should return available seats" do
        expected = bus_booking.seats_left
        result = product.get_available_bus( bus_booking.booking_date )[:seats_left]
    
        result.should eq expected
      end

      it "make another booking, same day, different product, should return available seats" do
        bus2 = create(:bus)
        p2 = create(:booking_product )
        bus_booking2 = create( :bus_booking, booking_date: bus_booking.booking_date, bus_id: bus2.id, product_id: p2.id, seats_left: 4)
        expected = bus_booking.seats_left
        result = product.get_available_bus( bus_booking.booking_date )[:seats_left]
    
        result.should eq expected
      end

      # it "make another booking, same day, different bus, same product, should return available seats" do
      #   bus2 = create(:bus)
      #   p2 = create(:booking_product )
      #   bus_booking2 = create( :bus_booking, booking_date: bus_booking.booking_date, bus_id: bus2.id, product_id: product.id, seats_left: 4)
      #   expected = bus_booking.seats_left
      #   expected2 = bus_booking2.seats_left
      #   result = product.get_available_bus( bus_booking.booking_date )[:seats_left]
      #     
      #   (result.should eq expected) || (result.should eq expected2)
      # end

      it "make another booking, same day, different bus, different product, should return available seats" do
        bus2 = create(:bus)
        p2 = create(:booking_product )
        bus_booking2 = create( :bus_booking, booking_date: bus_booking.booking_date, bus_id: bus2.id, product_id: p2.id, seats_left: 4)
        
        
        expected = bus_booking.seats_left
        result = product.get_available_bus( bus_booking.booking_date )[:seats_left]
    
        result.should eq expected
      end


  end


end