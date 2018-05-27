class V1::TripsController < V1::BaseController
  def create
    cab_finder = CabFinder.new trip_params
    json_response(cab_finder.perform, :created)
  end

  private 

  def trip_params
    params.permit(:pickup_time, :passenger_count, :trip_distance, :pickup_longitude, :pickup_latitude, :dropoff_longitude,
      :dropoff_latitude, :payment_type, :fare_amount, :tax_amount, :extra, :tolls_amount, :surcharge, :total_amount,
      :payment_status, :trip_status, :dropoff_time, :rates, :cab_type, :rider_id)
  end
end
