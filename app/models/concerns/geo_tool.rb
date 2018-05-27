module GeoTool
  def distance_between_points(source_point, target_point)
    Geocoder::Calculations.distance_between(source_point, target_point)
  end
end