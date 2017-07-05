FactoryGirl.define do
  factory :trip do
    blogpost

    transient { location_count 2 }
    after(:build) do |trip, evaluator|
      create_list(:location_for_trip, evaluator.location_count, locationable: trip)
    end
  end
end
