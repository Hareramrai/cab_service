class DropLocationFieldsFromDriver < ActiveRecord::Migration[5.1]
  def change
    remove_column :drivers, :current_latitude
    remove_column :drivers, :current_longitude
    remove_column :drivers, :trip_end_lat
    remove_column :drivers, :trip_end_long
  end
end
