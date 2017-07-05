class Location < ApplicationRecord
  belongs_to :locationable, polymorphic: true

  validates :latitude,
            presence: true,
            numericality: true,
            inclusion: { in: -90 .. 90,
                         message: "%{value} should be in the intervall -90 to 90" }
end
