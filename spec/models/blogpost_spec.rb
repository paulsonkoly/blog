# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blogpost, type: :model do
  subject { FactoryBot.build(:blogpost) }

  it { is_expected.to be_valid }

  context 'with a blank title' do
    it 'is invalid' do
      invalid = FactoryBot.build(:blogpost, title: '')
      expect(invalid).not_to be_valid
    end
  end

  context 'with a blank date' do
    it 'is invalid' do
      invalid = FactoryBot.build(:blogpost, date: nil)
      expect(invalid).not_to be_valid
    end
  end
end
