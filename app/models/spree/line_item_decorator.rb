Spree::LineItem.class_eval do

  # attr_accessor :booking_date
  validates :booking_date, presence: { :message => "Booking date is required." }

  def amount
    a = price * adults + price * children * 0.55
  end
  
end

