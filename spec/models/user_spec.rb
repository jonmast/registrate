require 'rails_helper'

RSpec.describe User do
  %w(
    name
    address1
    address2
    city
    state
    zip
    flock_name
    email
    phone
    fax
    latitude
    longitude
  ).each do |attribute|
    it { is_expected.to have_attribute attribute }
  end

  %w(
    name
    address1
    city
    state
    zip
    flock_name
    email
    phone
  ).each do |required_attribute|
    it { is_expected.to validate_presence_of required_attribute }
  end
end
