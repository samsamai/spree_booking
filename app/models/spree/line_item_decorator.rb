Spree::LineItem.class_eval do
  belongs_to :bus
  
  # attr_accessor :booking_date
  validates :booking_date, presence: { :message => "Booking date is required." }
  validates :bus_id, presence: true

  # after_save :make_booking

  def amount
    a = price * adults + price * children * 0.55
  end
  

end

