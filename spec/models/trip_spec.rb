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

  describe 'class' do
    subject { Trip }
    
    it { is_expected.to respond_to(:total_distance) }

    describe '.total_distance' do
      it 'returns the correct value' do
        trip1, trip2 = 2.times.map { FactoryGirl.create :trip }
        expect(subject.total_distance).to eq(trip1.length + trip2.length)
      end

      context 'with no trip' do
        it 'returns 0' do
          expect(subject.count).to eq(0)
          expect(subject.total_distance).to eq(0)
        end      
      end
    end

    it { is_expected.to respond_to(:longest_distance) }

    # TODO : this knows too much about the implementation. The correct
    # thing to do is to put the trips with the right lengths into the
    # database and let the test fetch the real things.
    describe '.longest_distance' do
      it 'returns the correct value' do
        trip1, trip2 = 2.times.map { FactoryGirl.create :trip }
        allow(trip1).to receive(:length).and_return(10)
        allow(trip2).to receive(:length).and_return(20)
        allow(Trip).to receive(:all).and_return([trip1, trip2])

        expect(subject.longest_distance).to eq(trip2)
      end
    end
  end
end
