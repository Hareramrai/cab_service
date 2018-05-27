FactoryBot.define do
  factory :trip do
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
    trip_status "pending"
    dropoff_time "2018-05-21 15:55:59"
    driver 
    rider 
    trait :valid_pickup do 
      pickup_longitude 77.713031
      pickup_latitude 12.937815
      dropoff_longitude 77.676027
      dropoff_latitude 13.000130
    end

    trait :out_of_reach do 
      pickup_longitude 77.623342 
      pickup_latitude 12.917654
      dropoff_longitude 77.676027
      dropoff_latitude 13.000130
    end
  end
end
