# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# SBI Panathur lat - 12.940904, 
# MahadevPura lat - 12.991280
# Sobha Dream Acre lat - 12.939080, long - 77.720199

unless Vendor.exists?
  vendor = Vendor.create(email: "füber@yopmail.com", name: "füber", phone:"9876543210", description: "A Customer SaaS customer")
  
  owner = Owner.create(email: "owneroffüber@yopmail.com", name: "owner1", phone:"9876543210", address: "test address",
    zip: "560103", state: "KA", country: "IN", active: true, vendor_id: vendor.id)
  
  driver1 = Driver.create(name: "Driver1", email: "Driver1@yopmail.com", phone: "9876543210", city: "Bangalore",
    state: "KA", country: "IN", number_of_trips: 0, ratings: 0, join_on: Time.now, owner_id: owner.id)
  
  driver2 = Driver.create(name: "Driver2", email: "Driver2@yopmail.com", phone: "9876543211", city: "Bangalore",
    state: "KA", country: "IN", number_of_trips: 0, ratings: 0, join_on: Time.now, owner_id: owner.id)

  driver3 = Driver.create(name: "Driver3", email: "Driver3@yopmail.com", phone: "1234567890", city: "Bangalore",
    state: "KA", country: "IN", number_of_trips: 0, ratings: 0, join_on: Time.now, owner_id: owner.id)
  
  indica_model = CabModel.create!(name: "Tata Indica LEI", engine: "1405 cc, Manual, Petrol",seats: 4, color: 'Silver', air_conditioning: true)

  indica_car = Cab.create(plat_number: "KA 2323 12", wi_fi: true, audio_system: true,type: "Cab", cab_model_id: indica_model.id, driver_id: driver1.id)

  indica_car.create_cab_location!(current_latitude: 12.991280, current_longitude: 77.687367, trip_end_lat: nil , trip_end_long: nil)
  
  toyota_model = CabModel.create(name: "Toyota Platinum Etios 1.4 GXD", engine: "1364 cc, Manual, Diesel", seats: 4, color: "pink", air_conditioning: true)
  toyota_car = PinkCab.create(plat_number: "KA 1234 21", wi_fi: true, audio_system: true, cab_model_id: toyota_model.id, driver_id: driver2.id)
  toyota_car.create_cab_location(current_latitude: 12.940904, current_longitude: 77.695763)

  # sample data setup for booking an cab which is about to complete the trip
  toyota_car2 = PinkCab.create(plat_number: "KA 1234 21", wi_fi: true, audio_system: true, cab_model_id: toyota_model.id, driver_id: driver3.id)
  toyota_car2.create_cab_location(current_latitude: 12.940904, current_longitude: 77.695763, trip_end_lat: 12.939080 , trip_end_long: 77.720199)
  
  rider = Rider.create(name: "Hare Ram Rai", email: "hareror@gmail.com", phone: "+918884586139", city: "Bangalore", 
    state: "KA", country: "IN", gender: "Male", ratings: 0, number_of_trips: 0)
end
