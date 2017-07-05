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
    it 'is valid with a value -90.0' do
      valid = FactoryGirl.build(:location, latitude: -90.0)
      expect(valid).to be_valid
    end

    it 'is valid with a value 90.0' do
      valid = FactoryGirl.build(:location, latitude: 90.0)
      expect(valid).to be_valid
    end
  end
end
