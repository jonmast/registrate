require 'rails_helper'

RSpec.feature 'Searches' do
  context 'search by sheep id' do
    scenario 'animal exists' do
      visit root_path
      animal = FactoryGirl.create(:animal)
      within('.navbar') do
        fill_in 'Search members', with: animal.registration_id
        click_button :search
      end
      expect(current_path).to eq animal_path(animal)
    end
  end
end
