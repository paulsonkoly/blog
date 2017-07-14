require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }

  it { is_expected.to be_valid }
  
  it 'is invalid with blank name' do
    subject.name = ""
    expect(subject).not_to be_valid
  end

  it 'has unique name' do
    subject.save
    subject2 = subject.dup
    expect(subject2).not_to be_valid
  end

  it 'has a password minimum length of 6' do
    subject.password = '12345'
    subject.password_confirmation = subject.password
    expect(subject).not_to be_valid    
  end

  it 'has a matching password_confirmation' do
    subject.password_confirmation = subject.password + 'x'
    expect(subject).not_to be_valid
  end
end
