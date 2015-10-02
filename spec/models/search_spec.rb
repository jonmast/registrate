require 'rails_helper'

RSpec.describe Search do
  it 'searches users' do
    expect(User).to receive(:search).with('searchterm').and_return(double.as_null_object)
    Search.new(term: 'searchterm').users
  end
end
