require 'rails_helper'

RSpec.feature 'AddUsers' do
  scenario 'register new user' do
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'supersecret'
    fill_in 'Password confirmation', with: 'supersecret'
    fill_in 'Address1', with: '1600 Pennsylvania Ave'
    fill_in 'City', with: 'Washington'
    fill_in 'State', with: 'DC'
    fill_in 'Zip', with: '20500'
    click_button 'Sign up'
    expect(page).to have_content 'Sign out'
  end
end
