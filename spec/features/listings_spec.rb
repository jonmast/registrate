require 'rails_helper'

RSpec.feature 'Listings', type: :feature do
  scenario 'user lists a sheep for sale' do
    user = FactoryGirl.create(:user)
    user.confirm
    animal = FactoryGirl.create(:animal, owner: user)
    sign_in(animal.owner)

    visit animal_path(animal)
    click_button 'List for Sale'
    fill_in 'Price', with: '450'
    fill_in 'Description', with: 'You gotta buy this awesome sheep!'
    click_button 'Create Listing'

    expect(page).to have_css(:h1, text: '$450')
  end
end
