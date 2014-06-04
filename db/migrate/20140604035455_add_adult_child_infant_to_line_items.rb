class AddAdultChildInfantToLineItems < ActiveRecord::Migration
  def change
    add_column :spree_line_items, :adults, :integer
    add_column :spree_line_items, :children, :integer
    add_column :spree_line_items, :under4, :integer
  end
end
