class Bus < ActiveRecord::Base
  has_many  :line_items
  has_many :bus_bookings

  validates :seats, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
