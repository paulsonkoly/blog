# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user-#{n}" }
    sequence(:password) { |n| "password-#{n}" }
    password_confirmation { password }
  end
end
