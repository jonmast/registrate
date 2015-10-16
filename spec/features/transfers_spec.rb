require 'rails_helper'

RSpec.feature 'Transfers' do
  scenario 'transfer my animal' do
    user = sign_in
    animal = FactoryGirl.create(:animal, owner: user)
    other_user = FactoryGirl.create(:user)
    visit animal_path(animal)
    select other_user.name, from: 'Buyer'
    click_button 'Transfer'
    expect(page).to have_content('Success')
    expect(Transfer.count).to eq 1
    expect(animal.reload.owner).to eq other_user
  end
end
