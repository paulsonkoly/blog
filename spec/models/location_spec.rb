require 'rails_helper'

RSpec.describe Location, type: :model do
  subject { FactoryGirl.build(:location) }

  it { is_expected.to be_valid }

  describe '#latitude' do
    it 'is invalid with blank latitude' do
      invalid = FactoryGirl.build(:location, latitude: nil)
      expect(invalid).not_to be_valid
    end

    it 'is invalid with non-numeric value' do
      invalid = FactoryGirl.build(:location, latitude: 'xxx')
      expect(invalid).not_to be_valid
    end

    it 'is invalid with a value outside of -90 to 90' do
      invalid = FactoryGirl.build(:location, latitude: 100.0)
      expect(invalid).not_to be_valid
    end

    # test edge cases
    it 'is valid with value -90.0' do
      valid = FactoryGirl.build(:location, latitude: -90.0)
      expect(valid).to be_valid
    end

    it 'is valid with value 90.0' do
      valid = FactoryGirl.build(:location, latitude: 90.0)
      expect(valid).to be_valid
    end

    it 'is valid to use minutes' do
      valid = FactoryGirl.build(:location, latitude: '73\'17.50')
      expect(valid).to be_valid
    end

    it 'has to constrain minutes to 0-59' do
      valid = FactoryGirl.build(:location, latitude: '73\'60.50')
      expect(valid).not_to be_valid
    end

    it 'has to convert to the right value' do
      loc = FactoryGirl.build(:location, latitude: '73\'30')
      expect(loc.latitude).to eq(73.5)
    end

    it 'has to convert negative numbers' do
      loc = FactoryGirl.build(:location, latitude: '-73\'30')
      expect(loc.latitude).to eq(-73.5)
    end
  end

  describe '#longitude' do
    it 'is invalid with blank longitude' do
      invalid = FactoryGirl.build(:location, longitude: nil)
      expect(invalid).not_to be_valid
    end

    it 'is invalid with non-numeric value' do
      invalid = FactoryGirl.build(:location, longitude: 'xxx')
      expect(invalid).not_to be_valid
    end

    it 'is invalid with a value outside of -180 to 180' do
      invalid = FactoryGirl.build(:location, longitude: 200.0)
      expect(invalid).not_to be_valid
    end

    # test edge cases
    it 'is valid with value -180.0' do
      valid = FactoryGirl.build(:location, longitude: -180.0)
      expect(valid).to be_valid
    end

    it 'is valid with value 180.0' do
      valid = FactoryGirl.build(:location, longitude: 180.0)
      expect(valid).to be_valid
    end

    it 'is valid to use minutes' do
      valid = FactoryGirl.build(:location, longitude: '73\'17.50')
      expect(valid).to be_valid
    end

    it 'has to constrain minutes to 0-59' do
      valid = FactoryGirl.build(:location, longitude: '73\'60.50')
      expect(valid).not_to be_valid
    end

    it 'has to convert to the right value' do
      loc = FactoryGirl.build(:location, longitude: '73\'30')
      expect(loc.longitude).to eq(73.5)
    end
  end
end
