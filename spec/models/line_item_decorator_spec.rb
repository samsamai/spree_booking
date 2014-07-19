require 'spec_helper'

describe Spree::LineItem  do
  let(:bus) {create( :bus )}
  let(:product) {create( :product, child_price: 5 )}
  let(:variant) {product.master}

  before(:each) do
    @li = create( :line_item, variant: variant, booking_date: Date.today, adults: 1, children: 1, under4: 0,
    bus: bus )
  end

  it "should be valid" do
    # Spree::LineItem.create(@valid_attributes)
    
    li = create( :line_item, variant: variant, booking_date: Date.today, adults: 1, children: 1, under4: 0,
    bus: bus )
  end
  
  it "should respond to adults, children, under4, booking_date, bus_booking_id, bus_id" do
    @li.should respond_to :adults
    @li.should respond_to :children
    @li.should respond_to :under4
    @li.should respond_to :booking_date
    @li.should respond_to :bus_booking_id
    @li.should respond_to :bus_id
  end
  
  describe "#amount" do
    it "should return total amount" do
      # Spree::LineItem.create(@valid_attributes)
    
      @li = create( :line_item, variant: variant, booking_date: Date.today, adults: 1, children: 1, under4: 0,
      bus: bus )

       expected = @li.price + @li.product.child_price
       result = @li.amount
     
       result.to_f.should eq expected 
    
    end
  end

end