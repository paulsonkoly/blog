require 'rails_helper'

RSpec.describe Trip, type: :model do
  subject { FactoryGirl.build(:trip) }

  it { is_expected.to be_valid }

  it "has at least 2 locations" do
    # until it's saved to the database, the count is 0 although the
    # activerecord has the set attributes
    subject.save
    expect(subject.locations.count).to be >= 2
  end

  context "with less than 2 locations" do
    subject { FactoryGirl.build :trip, location_count: 1 }

    it { is_expected.not_to be_valid }
  end
end
