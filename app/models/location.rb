class Location < ApplicationRecord
  belongs_to :locationable, polymorphic: true, optional: true

  {latitude: 90, longitude: 180}.each do |dimension, limit|
    validates dimension,
              presence: true,
              numericality: true,
              inclusion: { in: -limit .. limit,
                           message: "%{value} should be in the intervall -#{limit} to #{limit}" }
  end
end
