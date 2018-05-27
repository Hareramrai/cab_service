FactoryBot.define do
  factory :vendor do
    name { Faker::Company.unique.name }
    email { Faker::Internet.unique.email }
    phone Faker::PhoneNumber.cell_phone
    description "MyString"
  end
end
