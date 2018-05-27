class Cab < ApplicationRecord
  belongs_to :cab_model
  belongs_to :driver
  has_one :cab_location
end
