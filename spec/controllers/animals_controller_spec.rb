require 'rails_helper'

RSpec.describe AnimalsController, type: :controller do
  it 'creates animal if signed in' do
    animal = FactoryGirl.build(:male_animal)
    user = FactoryGirl.create(:user)
    user.confirm
    sign_in user
    attributes = animal.attributes
    attributes['breed'] = animal.breed
    attributes['gender'] = animal.gender
    expect { post :create, animal: attributes }.to change { Animal.count }
  end
  it 'does not create animal if not signed in' do
    animal = FactoryGirl.build(:male_animal)
    expect { post :create, animal: animal.attributes }.to_not change { Animal.count }
    expect(subject).to redirect_to new_user_session_path
  end
end
