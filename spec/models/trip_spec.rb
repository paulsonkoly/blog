# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trip, type: :model do
  subject { FactoryBot.build(:trip) }

  it { is_expected.to be_valid }

  it 'has at least 2 locations' do
    # until it's saved to the database, the count is 0 although the
    # activerecord has the set attributes
    subject.save
    expect(subject.locations.count).to be >= 2
  end

  context 'with less than 2 locations' do
    subject { FactoryBot.build :trip, location_count: 1 }

    it { is_expected.not_to be_valid }
  end

  describe 'class' do
    subject { Trip }

    it { is_expected.to respond_to(:total_distance) }

    describe '.total_distance' do
      it 'returns the sum of lengths of all trips' do
        trip1, trip2 = Array.new(2) { FactoryBot.create :trip }
        expect(subject.total_distance).to eq(trip1.length + trip2.length)
      end

      context 'with no trip' do
        it 'returns 0' do
          expect(subject.total_distance).to eq(0)
        end
      end
    end

    it { is_expected.to respond_to(:longest_distance) }

    describe '.longest_distance' do
      it 'returns the correct value' do
        # while this does not necessarily guarantee that trip2 is longer
        # in practice it will be. Note that location coordinates are randomly
        # generated on the Earth surface
        FactoryBot.create :trip, location_count: 2
        trip2 = FactoryBot.create :trip, location_count: 20

        expect(subject.longest_distance).to eq(trip2)
      end
    end
  end
end
