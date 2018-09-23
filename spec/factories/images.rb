# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    label { 'MyString' }
    file { '' }
    blogpost { nil }
  end
end
