require 'faker'
FactoryGirl.define do
  factory :animal do
    birth_date { Faker::Date.between(10.years.ago, Date.today) }
    type { %w(MaleAnimal FemaleAnimal).sample }
    birth_type { (0..5).to_a.sample }
    registration_type { %w(F P X).sample }
    artificial_insemination false
    embryo_transfer 'N'
    percentage 100
    breed { ['Dorper', 'White Dorper'].sample }

    factory :animal_with_parents do
      after(:create) { |animal| create_parents_tree(animal, 5) }
    end
  end
end
def create_parents_tree(animal, depth)
  return if depth == 0
  depth -= 1
  animal.sire = create_parents_tree(FactoryGirl.build(:ram), depth)
  animal.dam = create_parents_tree(FactoryGirl.build(:ewe), depth)
  animal.save!
  animal
end
