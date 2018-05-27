class CabLocation < ApplicationRecord
  acts_as_mappable :default_units => :kms,
                   :default_formula => :flat,
                   :lat_column_name => :current_latitude,
                   :lng_column_name => :current_longitude
  belongs_to :cab
  has_one :driver, through: :cab
  
  delegate :pending_trips, to: :driver, :allow_nil => true
end
