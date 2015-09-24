FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    password 'supersecret'
    password_confirmation 'supersecret'
    address1 { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip }
    sequence(:flock_name) { |n| "Flock #{n}" }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
  end
end
