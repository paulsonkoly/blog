class Blogpost < ApplicationRecord
  validates :title, presence: true

  has_many :locations, as: :locationable, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true

  has_one :trip, dependent: :destroy
  accepts_nested_attributes_for :trip
end
