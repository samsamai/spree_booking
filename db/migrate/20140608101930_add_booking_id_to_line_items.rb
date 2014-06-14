class AddBookingIdToLineItems < ActiveRecord::Migration
  def change
    add_column :spree_line_items, :bus_booking_id, :integer
  end
end
