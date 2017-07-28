FactoryGirl.define do
  factory :location do
    latitude { rand(-90..90) }
    longitude { rand(-180..180) }
    label "MyString"

    factory :location_for_blogpost do
      association :locationable, factory: :blogpost
    end

    factory :location_for_trip do
      association :locationable, factory: :trip
    end
  end
end
