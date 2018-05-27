class RiderSerializer < ActiveModel::Serializer
  attributes :id,  :name, :email, :phone, :city, :state, :country, :gender, :subscribe_for_notification, :ratings, :number_of_trips, :created_at, :updated_at
end
