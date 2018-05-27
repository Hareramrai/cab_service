class Trip < ApplicationRecord
  include AASM
  belongs_to :driver
  belongs_to :rider
  has_one :cab, through: :driver, source: :cab


  validates :pickup_longitude, :pickup_latitude, :dropoff_longitude, :dropoff_latitude, :payment_type, 
            :trip_status, presence: true

  # state machine definition
  aasm.attribute_name :trip_status

  aasm do

    state :pending, initial: true
    state :enroute
    state :started
    state :completed
    state :cancelled

    event :accept do
      transitions from: :pending, to: :enroute
    end

    event :start do 
      transitions from: :enroute, to: :started
    end

    event :complete do
      transitions from: :started, to: :completed
    end

    event :cancel do
      transitions from: :started, to: :cancelled
    end
    
  end
end
