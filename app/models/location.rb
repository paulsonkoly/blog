class Location < ApplicationRecord
  belongs_to :locationable, polymorphic: true

  validates :latitude,
            presence: true,
            numericality: true,
            inclusion: { in: -90 .. 90,
                         message: "%{value} should be in the intervall -90 to 90" }

  validates :longitude,
            presence: true,
            numericality: true,
            inclusion: { in: -180 .. 180,
                         message: "%{value} should be in the intervall -180 to 180" }
end
