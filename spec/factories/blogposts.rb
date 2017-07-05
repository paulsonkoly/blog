FactoryGirl.define do
  factory :blogpost do
    sequence(:title) { |n| "My title ##{n}" }
    content "MyText"
  end
end
