class AddSeatLeftToBookings < ActiveRecord::Migration
  def change
        add_column :bookings, :seats_left, :integer
  end
end
