# frozen_string_literal: true

FactoryGirl.define do
  factory :image do
    label { 'MyString' }
    file { '' }
    blogpost { nil }
  end
end
