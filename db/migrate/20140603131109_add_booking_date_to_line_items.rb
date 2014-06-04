class AddBookingDateToLineItems < ActiveRecord::Migration
  def change
    add_column :spree_line_items, :booking_date, :date
  end
end
