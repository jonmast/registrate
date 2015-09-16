FactoryGirl.define do
  factory :animal do
    registration_id { Faker::Internet.slug }
    birth_date { Faker::Date.between(10.years.ago, Date.today) }
    gender { %w(M F).sample }
    birth_type { (0..5).to_a.sample }
    artificial_insemination false
    embryo_transfer 'N'
    percentage 100
  end
end
