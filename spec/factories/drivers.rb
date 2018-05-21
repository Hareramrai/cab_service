FactoryBot.define do
  factory :driver do
    name "MyString"
    email "MyString"
    phone "MyString"
    number_of_trips 1
    ratings ""
    join_on "2018-05-19 17:43:32"
    is_online false
    owner nil
  end
end
