require 'rails_helper'

RSpec.describe Animal do
  describe 'attributes' do
    %w(
      birth_date
      birth_type
      embryo_transfer
      percentage
      registration_type
      breed
      type
    ).each do |required_attribute|
      it { is_expected.to validate_presence_of required_attribute }
    end

    it { is_expected.to validate_inclusion_of(:percentage).in_range(1..100) }

    it { is_expected.to validate_inclusion_of(:birth_type).in_range(0..10) }

    it { is_expected.to define_enum_for(:registration_type).with('Fullblood' => 0, 'Purebred' => 1, 'Percentage' => 2) }

    it { is_expected.to define_enum_for(:breed).with(['Dorper', 'White Dorper']) }
  end

  describe 'associations' do
    %w(
      sire
      dam
      owner
      breeder
    ).each do |association|
      it { is_expected.to belong_to association }
    end

    it { is_expected.to have_many :transfers }
  end

  describe 'sire and dam associations' do
    it 'allows setting a sire' do
      sire = FactoryGirl.create(:male_animal)
      progeny = FactoryGirl.create(:animal, sire: sire)
      expect(progeny).to be_valid
      expect(progeny.sire).to eq sire
    end

    it 'allows setting a dam' do
      dam = FactoryGirl.create(:female_animal)
      progeny = FactoryGirl.create(:animal, dam: dam)
      expect(progeny).to be_valid
      expect(progeny.dam).to eq dam
    end
  end

  describe 'validations' do
    let(:sheep) { FactoryGirl.build(:male_animal) }

    it "doesn't allow setting embryo_transfer to z" do
      expect { sheep.embryo_transfer = 'z' }.to raise_error ArgumentError
    end
  end

  describe '#add_sire' do
    it 'allows setting sire from registration_id' do
      sire = FactoryGirl.create(:male_animal)
      sheep = FactoryGirl.create(:male_animal)
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

    it 'is invalid if sire is female' do
      sheep = FactoryGirl.create(:male_animal)
      female_sire = FactoryGirl.create(:female_animal)
      sheep.add_sire(female_sire.registration_id)
      expect(sheep.sire).to be_nil
      expect(sheep).to_not be_valid
    end
  end

  describe '#registration_id' do
    it 'is generated from id' do
      sheep = FactoryGirl.build(:ram, id: 123, registration_type: 'Fullblood')
      expect(sheep.registration_id).to eq 'RF000123'
    end
  end

  describe '#transfer_to' do
    let(:sheep) { FactoryGirl.create(:animal) }
    let(:user) { FactoryGirl.create(:user) }

    it 'changes the owner' do
      sheep.transfer_to user
      expect(sheep.owner).to eq user
    end

    it 'logs the transfer' do
      sheep.transfer_to(user)
      transfer = sheep.transfers.last
      expect(transfer.buyer).to eq user
    end
  end

  describe '#display_name' do
    it 'combines registration type, breed, and gender' do
      animal = FactoryGirl.build(:male_animal)
      expect(animal.display_name).to eq "#{animal.registration_type} #{animal.breed} #{animal.gender}"
    end
  end
end
