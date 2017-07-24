class Comment < ApplicationRecord
  belongs_to :blogpost

  validates :content, presence: true
end
