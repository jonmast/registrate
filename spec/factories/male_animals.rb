FactoryGirl.define do
  factory :male_animal, parent: :animal, aliases: [:ram], class: 'MaleAnimal' do
    type 'MaleAnimal'
  end
end
