require 'rails_helper'

RSpec.feature 'ShowUsers' do
  scenario 'user info page' do
    user = FactoryGirl.create(:user)
    animal = FactoryGirl.create(:male_animal, owner: user)
    visit user_path(user)
    within('#attributes') do
      expect(page).to have_content user.name
    end
    expect(page).to have_link(animal.registration_id, href: animal_path(animal))
  end
end
