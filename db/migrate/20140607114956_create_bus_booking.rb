class CreateBusBooking < ActiveRecord::Migration
  def change
    create_table :bus_bookings do |t|
      t.date  :booking_date
      t.integer :bus_id
      t.integer :product_id
      t.integer :seats_left

      t.timestamps
    end
  end
end
