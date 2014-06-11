class AddSeatLeftToBookings < ActiveRecord::Migration
  def change
        add_column :bookings, :child_price, :integer
  end
end
