# frozen_string_literal: true

FactoryGirl.define do
  factory :blogpost do
    sequence(:title) { |n| "My title ##{n}" }
    date { rand(20).days.ago(Date.today) }
    content { 'MyText' }
  end
end
