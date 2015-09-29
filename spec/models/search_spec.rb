require 'rails_helper'

RSpec.describe Search do
  it 'searches users' do
    expect(User).to receive(:search).with('searchterm')
    Search.new(term: 'searchterm').users
  end
end
