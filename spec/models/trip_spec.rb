require 'rails_helper'

RSpec.describe Trip, type: :model do
  subject { FactoryGirl.build :trip }

  it { is_expected.to be_valid }
  
  it "has at least 2 locations" do
    expect(subject.locations.count).to be >= 2
  end
end
