require 'rails_helper'

RSpec.feature 'CreateAnimals' do
  scenario 'with valid data' do
    visit new_animal_path
    birth_date = 2.months.ago
    select birth_date.year, from: 'animal_birth_date_1i'
    select birth_date.strftime('%b'), from: 'animal_birth_date_2i'
    select birth_date.day, from: 'animal_birth_date_3i'
    fill_in 'Birth type', with: '2'
    fill_in 'Percentage Dorper', with: 100
    fill_in 'Sire', with: FactoryGirl.create(:ram).registration_id
    fill_in 'Dam', with: FactoryGirl.create(:ewe).registration_id
    select 'Male', from: 'Gender'
    expect { click_button 'Submit' }.to change { Animal.count }
    within('#attributes') do
      expect(page).to have_content('Male')
    end
  end

  scenario 'with invalid data' do
    visit new_animal_path
    expect { click_button 'Submit' }.to_not change { Animal.count }
    expect(page).to have_content "can't be blank"
  end
end
