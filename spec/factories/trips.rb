FactoryGirl.define do
  factory :trip do
    blogpost

    transient { location_count 2 }

    after(:build) do |trip, evaluator|
      # ensure that we are valid by adding 2 locations
      trip.assign_attributes(locations_attributes:
                               attributes_for_list(:location_for_trip,
                                                   evaluator.location_count))
    end
  end
end
