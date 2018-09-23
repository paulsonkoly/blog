# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { FactoryBot.build :comment }

  it { is_expected.to be_valid }

  it 'is invalid with empty content' do
    expect(FactoryBot.build(:comment, content: '')).not_to be_valid
  end

  it 'is invalid with empty name' do
    expect(FactoryBot.build(:comment, name: '')).not_to be_valid
  end

  it 'is invalid with empty email' do
    expect(FactoryBot.build(:comment, email: '')).not_to be_valid
  end

  it 'is invalid with incorrect email' do
    expect(FactoryBot.build(:comment, email: 'xy')).not_to be_valid
  end
end
