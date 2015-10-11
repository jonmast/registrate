FactoryGirl.define do
  factory :user do
    flock_name { Faker::Lorem.word.capitalize + [' Farm', ' Ranch'].sample }
    name { Faker::Name.name }
    password 'supersecret'
    password_confirmation 'supersecret'
    address1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
  end
end
