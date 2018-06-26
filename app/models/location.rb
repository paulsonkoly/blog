class Location < ApplicationRecord
  belongs_to :locationable, polymorphic: true, optional: true
  acts_as_mappable lat_column_name: :latitude, lng_column_name: :longitude,
                   default_units: :nms

  { latitude: 90, longitude: 180 }.each do |dimension, limit|
    validates dimension,
              presence: true,
              numericality: true,
              inclusion: { in: -limit .. limit,
                           message: "%{value} should be in the intervall -#{limit} to #{limit}" }
  end

  [ :latitude, :longitude ].each do |dimension|
    define_method(:"#{dimension}=") do |actual|
      case actual
      when String
        if actual =~ /(-?\d{1,3})'([0-5]?\d(?!\d))(\.\d+)?/
          deg = $1.to_i
          min = $2&.to_i&.fdiv(60) || 0
          min *= -1 if deg < 0
          dec = $3&.to_f&.fdiv(60) || 0
          dec *= -1 if deg < 0

          return write_attribute(dimension, deg + min + dec)
        end
      end
      write_attribute dimension, actual
    end
  end
end
