class CabFinder
  include GeoTool
  def initialize(params)
    @trip = Trip.new params
    @cab_location = nil
  end

  def perform
    cab_for_booking = near_by_cab_locations.detect { |cab_location| available_for_booking?(cab_location) }
    if cab_for_booking.present?
      @cab_location = cab_for_booking
    else
      raise Exceptions::CabNotFoundError.new "Sorry! No cabs available for your preference."
    end
    create_trip_and_update_location
    @trip
  end


  def search_limit
    Rails.application.secrets.cab_search_limit
  end

  private 

  def create_trip_and_update_location
    ActiveRecord::Base.transaction do
      if @cab_location.trip_end_lat.blank?
        @cab_location.update(trip_end_lat: @trip.dropoff_latitude, trip_end_long: @trip.dropoff_longitude)
      end
      @trip.driver = @cab_location.driver
      @trip.save!
    end
  end

  def near_by_cab_locations 
    @near_by_cab_locations ||= CabLocation.preload(:cab)
      .within(search_limit, :origin => [@trip.pickup_latitude, @trip.pickup_longitude])
      .joins(:cab).where(cabs: { type: @trip.cab_type})
  end

  def available_for_booking? cab_location
    cab_idle?(cab_location) || ( no_pending_trips?(cab_location) && completing_near_by?(cab_location) )
  end 

  def cab_idle? cab_location
    cab_location.trip_end_lat.blank? && cab_location.trip_end_long.blank?
  end

  def completing_near_by? cab_location
    distance_between_points([cab_location.trip_end_lat, cab_location.trip_end_long], [@trip.pickup_latitude, @trip.pickup_longitude]) <= search_limit
  end

  def no_pending_trips? cab_location
    cab_location.pending_trips.size == 0
  end
end
