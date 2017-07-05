class Image < ApplicationRecord
  belongs_to :blogpost
  has_attached_file :file,
                    styles: {icon: "32x32#", thumbnail: "128x128>", large: "800x600>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
