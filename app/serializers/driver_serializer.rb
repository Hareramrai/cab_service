class DriverSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :city, :state, :country, :number_of_trips, :ratings, :join_on, :is_online, :owner_id, 
  :created_at, :updated_at

  has_one :cab
end
