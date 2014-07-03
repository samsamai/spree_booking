    class BusBooking < ActiveRecord::Base
      belongs_to :bus
      belongs_to :product,  class_name: "Spree::Product"

      has_many :line_items,  class_name: "Spree::LineItem"

      # attr_accessor :seats_left

      validates :seats_left, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    end
