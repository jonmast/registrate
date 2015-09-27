require 'rails_helper'

RSpec.feature 'ShowAnimals' do
  scenario 'list sheep attributes on show page' do
    sheep = FactoryGirl.create(:animal, birth_date: (5.years + 11.months).ago)
    visit animal_path(sheep)
    within '#attributes' do
      expect(page).to have_content(sheep.gender)
      expect(page).to have_content(sheep.percentage.to_s + '%')
      expect(page).to have_content(sheep.birth_type)
      expect(page).to have_content('(5 years old)')
      expect(page).to_not have_content('Progeny')
    end
  end

  scenario 'show sheep progeny on show page' do
    sire = FactoryGirl.create(:ram)
    progeny = FactoryGirl.build_list(:animal, 10)
    progeny.each do |animal|
      animal.sire = sire
      animal.save!
    end

    visit animal_path(sire)
    progeny.each do |animal|
      expect(page).to have_link(
        animal.registration_id,
        href: animal_path(animal)
      )
    end
  end

  scenario 'show parentage on show page' do
    animal = FactoryGirl.create(:animal)
    create_parents_tree(animal, 5)
    visit animal_path(animal)
    current_animal = animal
    depth = 1
    while (current_animal = current_animal.sire)
      break if depth == 4
      expect(page).to have_link(current_animal.registration_id, href: animal_path(current_animal))
      depth += 1
    end
    expect(page).to_not have_link(current_animal.registration_id, href: animal_path(current_animal))
  end

  scenario 'link to owner' do
    owner = FactoryGirl.create(:user)
    animal = FactoryGirl.create(:animal, owner: owner)
    visit animal_path(animal)
    within('#attributes') do
      expect(page).to have_link(owner.flock_name, href: user_path(owner))
    end
  end
end
