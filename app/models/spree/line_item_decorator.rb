Spree::LineItem.class_eval do
  belongs_to :bus
  belongs_to :bus_booking
    
  validates :booking_date, presence: { :message => "Booking date is required." }
  validates :bus_id, presence: { :message => "" }
  # validate :booking_date_is_valid

  def amount
    Rails.logger.debug( "DEBUG: product.child_price = '#{product.child_price}'" )
    a = price * adults + product.child_price * children 
  end
  
  private
    def booking_date_is_valid
    Rails.logger.debug( "DEBUG: self.booking_date = '#{self.booking_date}'" )

      self.errors.add :base, 'Booking date is required.' if self.booking_date.nil? 
    end


end

