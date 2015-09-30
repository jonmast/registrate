require 'rails_helper'

RSpec.describe AnimalsController, type: :controller do
  it 'creates animal if signed in' do
    animal = FactoryGirl.build(:animal)
    user = FactoryGirl.create(:user)
    user.confirm
    sign_in user
    attributes = animal.attributes
    attributes['breed'] = animal.breed
    expect { post :create, animal: attributes }.to change { Animal.count }
  end
  it 'does not create animal if not signed in' do
    animal = FactoryGirl.build(:animal)
    expect { post :create, animal: animal.attributes }.to_not change { Animal.count }
  end
end
