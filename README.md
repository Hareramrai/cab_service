# README

This application is going to work on SAAS model,so that it can be used by multiple vendor accorss the world and they don't have to build the complete & manage the complete application & infrastructure. Vendor will be going to opt for the service as per their need or based on the customers of target marketplace.


Things you may want to cover:

* Ruby version
- 2.4.0
* System dependencies
- Postgresql
* Configuration

* Database creation

- bundle exec rails db:setup

* Database initialization

* How to run the test suite

SIMPLECOV=true rspec

* Services (job queues, cache servers, search engines, etc.)
- Google Geo Service

* Deployment instructions

* ...

About Application models
--------

# Vendor 

This is going to be organization that are going to purchase our service to use our platform instead of managing the software development & infrastructure etc... 

# Owner 

These are user who is going to be owner of cab & can have driver for their cab. Also one owner can owns multiples car.

# Driver
These are the user who is going to accept the rider's request and will drive the car from pickup location to drop off location. 

# CabModel 
This is going to store model of a car with other information. 

# Cab 
This is going to assign to driver and a driver will have only one cab.

# CabLocation
This is going to store cab's current location. Currently I am going to store in db but can be store redis or some kind in memory storage service. Also we are going to have rotation policy, may be we can clean or move data from it after 1 or 2 hours.

# Riders
This is going to store rider's basic details. 


# Trips 
This is going to store trip related data like pickup location, drop location, rates etc. 

#Rates
This is going to store the rates like price per km  , price per minutes, price for sedan/SUV or color based car. 
Also rate can very depending on vendor. 

# Future Scope 

- We can provide service based on requirements, like number of hardwares or different features or support for any customization based on vendor.


# API 

# Booking a trip 

When there is no cab around you
--------------------------------

- Use below sample data for this usecase. 

````
curl -X POST \
  http://localhost:3000/v1/trips \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
    "passenger_count": 4,
    "pickup_longitude": 77.623342, 
    "pickup_latitude": 12.917654,
    "dropoff_longitude": 77.676027,
    "dropoff_latitude": 13.000130,
    "payment_type": "cash",
  "cab_type": "PinkCab",
  "rider_id": 1
}'
````
- Response of above curl command 

````
{
    "message": "Sorry! No cabs available for your preference."
}
````

When there is a cab around you & got a cab
------------------------------

````
curl -X POST \
  http://localhost:3000/v1/trips \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
    "passenger_count": 4,
    "pickup_longitude": 77.713031,
    "pickup_latitude": 12.937815,
    "dropoff_longitude": 77.676027,
    "dropoff_latitude": 13.000130,
    "payment_type": "cash",
  "cab_type": "PinkCab",
  "rider_id": 1
}'
````

-  Response of above 

````
{
    "id": 1,
    "pickup_time": null,
    "passenger_count": 4,
    "trip_distance": null,
    "pickup_longitude": "77.713031",
    "pickup_latitude": "12.937815",
    "dropoff_longitude": "77.676027",
    "dropoff_latitude": "13.00013",
    "payment_type": "cash",
    "fare_amount": null,
    "tax_amount": null,
    "extra": null,
    "tolls_amount": null,
    "surcharge": null,
    "total_amount": null,
    "payment_status": null,
    "trip_status": "pending",
    "dropoff_time": null,
    "rates": null,
    "created_at": "2018-05-27T12:55:35.158Z",
    "updated_at": "2018-05-27T12:55:35.158Z",
    "cab_type": "PinkCab",
    "driver": {
        "id": 2,
        "name": "Driver2",
        "email": "Driver2@yopmail.com",
        "phone": "9876543211",
        "city": "Bangalore",
        "state": "KA",
        "country": "IN",
        "number_of_trips": 0,
        "ratings": 0,
        "join_on": "2018-05-26T20:38:18.195Z",
        "is_online": null,
        "owner_id": 1,
        "created_at": "2018-05-26T20:38:18.198Z",
        "updated_at": "2018-05-26T20:38:18.198Z"
    },
    "rider": {
        "id": 1,
        "name": "Hare Ram Rai",
        "email": "hareror@gmail.com",
        "phone": "+918884586139",
        "city": "Bangalore",
        "state": "KA",
        "country": "IN",
        "gender": "Male",
        "subscribe_for_notification": null,
        "ratings": 0,
        "number_of_trips": 0,
        "created_at": "2018-05-26T20:38:18.413Z",
        "updated_at": "2018-05-26T20:38:18.413Z"
    },
    "cab": {
        "id": 2,
        "plat_number": "KA 1234 21",
        "wi_fi": true,
        "type": "PinkCab",
        "audio_system": true,
        "description": null
    }
}
````


