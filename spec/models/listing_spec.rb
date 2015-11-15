require 'rails_helper'

RSpec.describe Listing, type: :model do
  describe '#phone' do
    it 'delegates to owner' do
      listing = FactoryGirl.build(:listing)
      listing.animal.owner = FactoryGirl.create(:user, phone: '1234567890')

      expect(listing.phone).to eq '1234567890'
    end
  end

  describe '#address' do
    it 'delegates to owner' do
      listing = FactoryGirl.build(:listing)
      listing.animal.owner = user = FactoryGirl.create(:user)

      expect(listing.address).to start_with(user.address1)
    end
  end
end
