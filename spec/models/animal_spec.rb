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
  end

  describe '#add_sire' do
    it 'allows setting sire from registration_id' do
      sire = FactoryGirl.create(:ram)
      sheep = FactoryGirl.build(:animal)
      sheep.add_sire(sire.registration_id)
      expect(sheep.sire).to eq sire
      expect(sheep).to be_valid
    end

    it 'is invalid if sire does not exist' do
      sheep = FactoryGirl.build(:animal)
      sheep.add_sire('<<invalid>>')
      expect(sheep.sire).to be_nil
      expect(sheep).to_not be_valid
    end
  end

  describe '#registration_id' do
    it 'is generated from id' do
      sheep = FactoryGirl.build(:ram, id: 123, registration_type: 'F')
      expect(sheep.registration_id).to eq 'RF000123'
    end
  end
end
