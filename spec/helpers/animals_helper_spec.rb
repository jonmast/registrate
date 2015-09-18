require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AnimalsHelper. For example:
#
# describe AnimalsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AnimalsHelper, :type => :helper do
  it 'works for even years' do
    expect(helper.age_in_words(2.years.ago)).to eq '2 years'
  end

  it 'works for years + months' do
    expect(helper.age_in_words((2.years + 11.months).ago)).to eq '2 years'
  end

  it 'works for one year' do
    expect(helper.age_in_words(1.year.ago)).to eq '1 year'
  end

  it 'shows months if less than 1 year' do
    expect(helper.age_in_words(2.months.ago)).to eq '2 months'
  end

  it 'works for months + days too' do
    expect(helper.age_in_words((11.months + 25.days).ago)).to eq '11 months'
  end
end
