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
    end
  end
end
