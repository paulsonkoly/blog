require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }

  it { is_expected.to be_valid }
  
  it "is invalid with blank name" do
    subject.name = ""
    expect(subject).not_to be_valid
  end

  it "is expected to check name uniqueness" do
    subject.save
    subject2 = subject.dup
    expect(subject2).not_to be_valid
  end
end
