# frozen_string_literal: true

FactoryGirl.define do
  factory :comment do
    content { 'MyText' }
    name { 'John Doe' }
    email { 'john21@blackhole.com' }
    blogpost
  end
end
