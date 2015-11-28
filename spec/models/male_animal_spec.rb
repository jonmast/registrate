require 'rails_helper'

RSpec.describe MaleAnimal do
  it { is_expected.to have_many :progeny }

  it 'has Male gender' do
    expect(subject.gender).to eq 'Male'
  end

  it 'has progeny for sires' do
    sire = FactoryGirl.create(:male_animal)
    progeny = FactoryGirl.create(:male_animal, sire: sire)
    expect(sire.progeny).to include progeny
  end
end
