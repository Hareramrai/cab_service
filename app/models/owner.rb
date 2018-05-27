class Owner < ApplicationRecord
  has_many :drivers
  belongs_to :vendor
end
