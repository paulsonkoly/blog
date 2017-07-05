require 'rails_helper'

RSpec.describe Location, type: :model do
  subject { FactoryGirl.build(:location) }

  it { is_expected.to be_valid }
end
