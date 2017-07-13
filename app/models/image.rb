class Image < ApplicationRecord
  belongs_to :blogpost

  mount_uploader :file, ImageUploader
end
