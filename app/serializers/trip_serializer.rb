class TripSerializer < ActiveModel::Serializer
  attributes :id, :pickup_time, :passenger_count, :trip_distance, :pickup_longitude, 
  :pickup_latitude, :dropoff_longitude, :dropoff_latitude, :payment_type, :fare_amount, :tax_amount, :extra, 
  :tolls_amount, :surcharge, :total_amount, :payment_status, :trip_status, :dropoff_time, :rates, :created_at, 
  :updated_at, :cab_type
  
  belongs_to :driver
  belongs_to :rider

  has_one :cab

end
