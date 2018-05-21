FactoryBot.define do
  factory :trip do
    driver nil
    rider nil
    pickup_time "2018-05-21 15:55:59"
    passenger_count 1
    trip_distance 1.5
    pickup_longitude 1.5
    pickup_latitude 1.5
    dropoff_longitude 1.5
    dropoff_latitude 1.5
    payment_type "MyString"
    fare_amount 1.5
    tax_amount 1.5
    extra 1.5
    tolls_amount 1.5
    surcharge 1.5
    total_amount 1.5
    payment_status "MyString"
    trip_status "MyString"
    dropoff_time "2018-05-21 15:55:59"
  end
end
