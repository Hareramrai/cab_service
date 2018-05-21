class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.references :driver, foreign_key: true
      t.references :rider, foreign_key: true
      t.timestamp :pickup_time
      t.integer :passenger_count
      t.decimal :trip_distance
      t.decimal :pickup_longitude
      t.decimal :pickup_latitude
      t.decimal :dropoff_longitude
      t.decimal :dropoff_latitude
      t.string :payment_type
      t.decimal :fare_amount
      t.decimal :tax_amount
      t.decimal :extra
      t.decimal :tolls_amount
      t.decimal :surcharge
      t.decimal :total_amount
      t.string :payment_status
      t.string :trip_status
      t.timestamp :dropoff_time
      t.string :rates, array: true
      t.boolean :marked_as_deleted, default: false
      t.timestamps
    end
  end
end
