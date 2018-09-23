# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }

  it { is_expected.to be_valid }

  context 'with blank name' do
    subject { FactoryGirl.build(:user, name: '') }

    it { is_expected.not_to be_valid }
  end

  context 'with clashing names' do
    before { subject.dup.save }

    it { is_expected.not_to be_valid }
  end

  context 'with too short password' do
    subject do
      FactoryGirl.build(:user,
                        password: '12345',
                        password_confirmation: '12345')
    end

    it { is_expected.not_to be_valid }
  end

  context 'with mismatching password confirmation' do
    subject do
      FactoryGirl.build(:user,
                        password: '1234567',
                        password_confirmation: '1234567x')
    end

    it { is_expected.not_to be_valid }
  end
end
