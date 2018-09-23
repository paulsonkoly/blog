# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { FactoryGirl.build :comment }

  it { is_expected.to be_valid }

  it 'is invalid with empty content' do
    expect(FactoryGirl.build(:comment, content: '')).not_to be_valid
  end

  it 'is invalid with empty name' do
    expect(FactoryGirl.build(:comment, name: '')).not_to be_valid
  end

  it 'is invalid with empty email' do
    expect(FactoryGirl.build(:comment, email: '')).not_to be_valid
  end

  it 'is invalid with incorrect email' do
    expect(FactoryGirl.build(:comment, email: 'xy')).not_to be_valid
  end
end
