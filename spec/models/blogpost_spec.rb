require 'rails_helper'

RSpec.describe Blogpost, type: :model do
  subject { FactoryGirl.build(:blogpost) }
  it { is_expected.to be_valid }

  it 'with blank title' do
    invalid = FactoryGirl.build(:blogpost, title: '')
    expect(invalid).not_to be_valid
  end
end
