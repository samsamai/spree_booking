class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date  :booking_date
      t.integer :bus_id
      t.integer :product_id

      t.timestamps
    end
  end
end
