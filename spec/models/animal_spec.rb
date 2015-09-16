require 'rails_helper'

RSpec.describe Animal do
  it 'allows setting a sire' do
    sire = FactoryGirl.create(:animal, gender: 'M')
    progeny = FactoryGirl.create(:animal, sire: sire)
    expect(progeny).to be_valid
    expect(progeny.sire).to eq sire
  end
  it 'allows setting a dam' do
    dam = FactoryGirl.create(:animal, gender: 'F')
    progeny = FactoryGirl.create(:animal, dam: dam)
    expect(progeny).to be_valid
    expect(progeny.dam).to eq dam
  end
end
