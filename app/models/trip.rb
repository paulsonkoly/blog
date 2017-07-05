class Trip < ApplicationRecord
  belongs_to :blogpost

  has_many :locations, as: :locationable, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true
end
