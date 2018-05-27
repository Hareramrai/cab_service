FactoryBot.define do
  factory :driver do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    phone Faker::PhoneNumber.cell_phone
    number_of_trips 1
    ratings ""
    join_on "2018-05-19 17:43:32"
    is_online false
    owner
  end
end
