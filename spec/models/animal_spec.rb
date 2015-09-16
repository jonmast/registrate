require 'rails_helper'

RSpec.describe Animal do
  describe 'sire and dam associations' do
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

    it 'has progeny for sires' do
      sire = FactoryGirl.create(:animal, gender: 'M')
      progeny = FactoryGirl.create(:animal, sire: sire)
      expect(sire.progeny).to include progeny
    end

    it 'has progeny for dams' do
      dam = FactoryGirl.create(:animal, gender: 'F')
      progeny = FactoryGirl.create(:animal, dam: dam)
      expect(dam.progeny).to include progeny
    end
  end
end
