require 'rails_helper'

RSpec.describe FemaleAnimal do
  it { is_expected.to have_many :progeny }

  it 'has Female gender' do
    expect(subject.gender).to eq 'Female'
  end

  it 'has progeny for dams' do
    dam = FactoryGirl.create(:female_animal)
    progeny = FactoryGirl.create(:animal, dam: dam)
    expect(dam.progeny).to include progeny
  end
end
