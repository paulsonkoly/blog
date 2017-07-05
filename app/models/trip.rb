class Trip < ApplicationRecord
  belongs_to :blogpost

  has_many :locations, as: :locationable, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true

  validates :locations, length: { minimum: 2,
                                  too_short: "should have at least two locations" }

end
