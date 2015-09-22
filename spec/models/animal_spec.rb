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

  describe 'validations' do
    let(:sheep) { FactoryGirl.build(:animal) }

    it 'requires gender to be M or F' do
      expect { sheep.gender = 'f' }.to raise_error
    end

    it "doesn't allow setting embryo_transfer to z" do
      expect { sheep.embryo_transfer = 'z' }.to raise_error
    end

    it 'requires sires to be male' do
      female_sire = FactoryGirl.create(:animal, gender: 'F')
      sheep.sire = female_sire
      expect(sheep).to_not be_valid
    end

    it 'requires dams to be female' do
      male_dam = FactoryGirl.create(:animal, gender: 'M')
      sheep.dam = male_dam
      expect(sheep).to_not be_valid
    end

    it 'requires percentage to be between 0 and 100' do
      sheep.percentage = 101
      expect(sheep).to_not be_valid
    end

    it 'requires registration_id to be unique' do
      FactoryGirl.create(:animal, registration_id: sheep.registration_id)
      expect(sheep).to_not be_valid
    end
  end
end
