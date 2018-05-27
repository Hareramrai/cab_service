FactoryBot.define do
  factory :cab_location do
    cab

    # out of current pickup location (hint)
    trait :mahadevpura do
      current_latitude 12.991280
      current_longitude 77.687367
    end

    # within reach of current pickup location & cab is free
    trait :sbi_panathur do 
      current_latitude 12.940904
      current_longitude 77.695763
    end

    # already on trip for a rider
    trait :sbi_panathur_and_sobha do 
      current_latitude 12.940904 
      current_longitude 77.695763 
      trip_end_lat 12.939080 
      trip_end_long 77.720199
    end
  end
end
