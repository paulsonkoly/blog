FactoryGirl.define do
  factory :location do
    latitude 1.5
    longitude 1.5
    label "MyString"

    factory :location_for_blogpost do
      association :locationable, factory: :blogpost
    end

    factory :location_for_trip do
      association :locationable, factory: :trip
    end
  end
end
