FactoryBot.define do
  factory :rider do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    phone Faker::PhoneNumber.cell_phone
    city "MyString"
    state "MyString"
    country "MyString"
    gender "MyString"
    subscribe_for_notification false
    ratings 1.5
    number_of_trips 1
  end
end
