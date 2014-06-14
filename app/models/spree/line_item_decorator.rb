Spree::LineItem.class_eval do
  belongs_to :bus
  belongs_to :bus_booking
    
  validates :booking_date, presence: { :message => "Booking date is required." }
  validates :bus_id, presence: { :message => "" }
  # validate :booking_date_is_valid

  def amount
    a = price * adults + price * children * 0.55
  end
  
  private
    def booking_date_is_valid
    Rails.logger.debug( "DEBUG: self.booking_date = '#{self.booking_date}'" )

      self.errors.add :base, 'Booking date is required.' if self.booking_date.nil? 
    end


end

