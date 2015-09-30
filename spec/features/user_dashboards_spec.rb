require 'rails_helper'

RSpec.feature 'UserDashboards' do
  scenario 'show dashboard upon signing in' do
    user = sign_in
    owned_animal = FactoryGirl.create(:animal, owner: user)
    bred_animal = FactoryGirl.create(:animal, breeder: user)
    visit root_path
    expect(page).to have_content user.name
    expect(page).to have_link owned_animal.registration_id, href: animal_path(owned_animal)
    expect(page).to_not have_link bred_animal.registration_id, href: animal_path(bred_animal)
    expect(page).to have_link 'Add new animal', href: new_animal_path
  end
end
