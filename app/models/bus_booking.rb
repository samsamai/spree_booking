    class BusBooking < ActiveRecord::Base
      belongs_to :bus
      belongs_to :product

      # attr_accessor :seats_left

      validates :seats_left, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    end
