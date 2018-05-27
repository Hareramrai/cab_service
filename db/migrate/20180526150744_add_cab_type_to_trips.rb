class AddCabTypeToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :cab_type, :string
  end
end
