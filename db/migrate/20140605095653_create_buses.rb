class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :name
      t.integer :seats

      t.timestamps
    end
  end
end
