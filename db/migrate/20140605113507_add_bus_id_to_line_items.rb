class AddBusIdToLineItems < ActiveRecord::Migration
  def change
    add_column :spree_line_items, :bus_id, :integer
  end
end
