require 'rails_helper'

RSpec.describe Transfer do
  it { is_expected.to belong_to :seller }

  it { is_expected.to belong_to :buyer }

  it { is_expected.to belong_to :animal }
end
