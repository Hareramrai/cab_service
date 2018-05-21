class CreateCabLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :cab_locations do |t|
      t.references :cab, foreign_key: true
      t.float :current_latitude
      t.float :current_longitude
      t.float :trip_end_lat
      t.float :trip_end_long

      t.timestamps
    end
  end
end
