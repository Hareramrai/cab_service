# README

This application is going to work on SAAS model,so that it can be used by multiple vendor accorss the world and they don't have to build the complete & manage the complete application & infrastructure. Vendor will be going to opt for the service as per their need or based on the customers of target marketplace.

# Future Scope 

- We can provide service based on requirements, like number of hardwares or different features or support for any customization based on vendor.

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

bundle exec rspec 

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