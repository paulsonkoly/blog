require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { FactoryGirl.build :comment }

  it { is_expected.to be_valid }

  context 'with empty content' do
    subject { FactoryGirl.build :comment, content: '' }
    it { is_expected.not_to be_valid }
  end
end
