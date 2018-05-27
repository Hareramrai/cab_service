class Driver < ApplicationRecord
  has_one :cab
  has_many :trips
  has_many :pending_trips, -> { where(trip_status: "pending") }, class_name: "Trip"
  belongs_to :owner
 
end
