FactoryGirl.define do
  factory :female_animal, parent: :animal, aliases: [:ewe], class: 'FemaleAnimal' do
    type 'FemaleAnimal'
  end
end
