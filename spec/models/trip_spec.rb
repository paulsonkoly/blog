require 'rails_helper'

RSpec.describe Trip, type: :model do
  subject { FactoryGirl.build :trip }

  it { is_expected.to be_valid }
end
