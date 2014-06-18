Spree::Product.class_eval do
  # has_many :bus_bookings, dependent: :destroy 
  validates :child_price, presence: true
  # delegate_belongs_to :child_price
  # 
  # has_many :child_prices, -> { order('spree_variants.position, spree_variants.id, currency') }, through: :variants
  
  # private
  # # Builds variants from a hash of option types & values
  # def build_variants_from_option_values_hash
  #   ensure_option_types_exist_for_values_hash
  #   values = option_values_hash.values
  #   values = values.inject(values.shift) { |memo, value| memo.product(value).map(&:flatten) }
  # 
  #   values.each do |ids|
  #     variant = variants.create(
  #       option_value_ids: ids,
  #       price: master.price
  #       
  #     )
  #   end
  #   save
  # end
  
  # this is the original one which is checking for a specific product
  def get_disabled_dates
      disabled_dates = []
  
      bus_bookings = BusBooking.all
      bus_bookings.each do |bus_booking|
          if get_available_bus( bus_booking.booking_date ) == false
              disabled_dates << bus_booking.booking_date.strftime("%d-%m-%Y")
          end
      end
  
      return disabled_dates
  end
  
  
  # This one blocks out date
  # def self.get_disabled_dates_home_page
  #     disabled_dates = []
  # 
  #     bus_bookings = BusBooking.all
  #     bus_bookings.each do |bus_booking|
  #         if any_buses_available? bus_booking.booking_date
  #             disabled_dates << bus_booking.booking_date.strftime("%d-%m-%Y")
  #         end
  #     end
  # 
  #     return disabled_dates
  # end
  # 
  # def self.any_buses_available?(date)
  # end

  # def get_available_bus( date )
  #     buses = Bus.all
  #     available = false
  #     available_bus = nil
  #     Rails.logger.debug( "DEBUG: get_available_bus = '#{date}'" )
  #     Rails.logger.debug( "DEBUG: get_available_bus = '#{date}'" )
  # 
  #     buses.each do |bus|
  #         bus_booking = BusBooking.where( booking_date: date, bus_id: bus.id).first
  #         if bus_booking.nil?
  #           available = true
  #           available_bus = bus
  #           break
  #         else
  #           if bus_booking.product_id == self.id
  #             if bus_booking.seats_left > 0
  #               available = true
  #               available_bus = bus
  #               break
  #             end
  #           end
  #         end
  #     end
  # 
  #     return available ? available_bus : false
  # end
  
  
#   
  def get_available_bus( date )
      buses = Bus.all
      available_bus = false
      buses.each do |bus|
          seats_left = bus_available?(date, bus )

          if seats_left
              available_bus = { bus: bus, seats_left: seats_left}
              return available_bus
          end
      end
      return available_bus
  end
  
  
  def bus_available?( date, bus )
    Rails.logger.debug( "DEBUG: date = '#{date}'" )
      bus_bookings = BusBooking.where( booking_date: date, bus_id: bus.id )
      if bus_bookings.length > 0
          bus_bookings.each do |bus_booking|
              if bus_booking.seats_left > 0 && bus_booking.product_id == self.id
                  return bus_booking.seats_left
              else
                  return false
              end
          end
      else
          return bus.seats
      end
  end
  
end

