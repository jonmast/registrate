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
    fill_in 'Flock name', with: 'Toadstool Ranch'
    fill_in 'Name', with: 'John Doe'
    click_button 'Sign up'
    expect(page).to have_css('.alert', text: 'confirmation')
  end

  scenario 'sign in user' do
    user = FactoryGirl.create(:user)
    user.confirm
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_link('Sign out', href: destroy_user_session_path)
  end
end
